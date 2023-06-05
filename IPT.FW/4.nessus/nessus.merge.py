# Based on https://gist.github.com/mastahyeti/2720173
# Updated for speed by: Kevin Dick, Tevora 

import xml.etree.cElementTree as etree
import shutil
import os
import argparse
from sets import Set

parser = argparse.ArgumentParser(description='Merge multiple nessus files into one')

parser.add_argument('directory', metavar='directory', help="directory where nessus files are stored")

parsed = parser.parse_args()

directory = parsed.directory
output_directory  =  "merged"
output_fulldir = os.path.join(directory, output_directory)

if not os.path.isdir(directory):
    print("directory does not exist")
    exit()

first = 1
hosts = {}
for fileName in os.listdir(directory):
   if ".nessus" in fileName:
      fileName=os.path.join(directory, fileName)
      print(":: Parsing", fileName)
      if first:
         mainTree = etree.parse(fileName)
         report = mainTree.find('Report')
         report.attrib['name'] = 'Merged Report'
         first = 0
         for host in report.findall('.//ReportHost'):
            findings = Set()
            for item in host.findall('ReportItem'):
              findings.add((item.attrib['port'] +"'][@pluginID='"+ item.attrib['pluginID']))
            hosts[host.attrib['name']] = findings

      else:
         tree = etree.parse(fileName)
         for host in tree.findall('.//ReportHost'):
            if not host.attrib['name'] in hosts:
                print "adding host: " + host.attrib['name']
                report.append(host)
                findings = Set()
                for item in host.findall('ReportItem'):
                  findings.add((item.attrib['port'] +"'][@pluginID='"+ item.attrib['pluginID']))
                hosts[host.attrib['name']] = findings
            else:
                for item in host.findall('ReportItem'):
                    if not (item.attrib['port'] +"'][@pluginID='"+ item.attrib['pluginID']) in hosts[host.attrib['name']]:
                        print "adding finding: " + item.attrib['port'] + ":" + item.attrib['pluginID']
                        existing_host = report.find(".//ReportHost[@name='"+host.attrib['name']+"']")
                        hosts[host.attrib['name']].add((item.attrib['port'] +"'][@pluginID='"+ item.attrib['pluginID']))
                        existing_host.append(item)
      print(":: => done.")    
   
if output_directory in os.listdir(directory):
   shutil.rmtree(output_fulldir)
   
os.mkdir(output_fulldir)
mainTree.write(os.path.join(output_fulldir, "merged.nessus"), encoding="utf-8", xml_declaration=True)