# Script for fetching SRR accession and metadata keys from sample XML files on the ena
# need a file containing the SRS accessions beforehand

import xml.etree.ElementTree as ET
import urllib.request, urllib.parse, urllib.error
import ssl
import json

acclist = ['SRS333664', 'SRS333665', 'SRS333666', 'SRS333667', 'SRS333668', 'SRS333669', 'SRS333670', 'SRS259434', 'SRS259435', 'SRS259436', 'SRS259437', 'SRS259438', 'SRS259439', 'SRS259440', 'SRS259441', 'SRS259442', 'SRS259443', 'SRS259444', 'SRS259445', 'SRS259446', 'SRS259447', 'SRS259448', 'SRS259449', 'SRS259450', 'SRS259451', 'SRS259452', 'SRS259453', 'SRS259454', 'SRS259455', 'SRS259456', 'SRS259457', 'SRS259458', 'SRS259459', 'SRS259460', 'SRS259461', 'SRS259462', 'SRS259463', 'SRS259464', 'SRS259465', 'SRS259466', 'SRS259467', 'SRS259468', 'SRS259469', 'SRS259470', 'SRS259471', 'SRS259472', 'SRS259473', 'SRS259474', 'SRS259475', 'SRS259476', 'SRS259477', 'SRS259478', 'SRS259479', 'SRS259480', 'SRS259481', 'SRS259482', 'SRS259483', 'SRS259484', 'SRS259485', 'SRS259486', 'SRS259487', 'SRS259488', 'SRS259489', 'SRS259490', 'SRS259491', 'SRS259492', 'SRS259493', 'SRS259494', 'SRS259495', 'SRS259496', 'SRS259497', 'SRS259498', 'SRS259499', 'SRS259500', 'SRS259501', 'SRS259502', 'SRS259503', 'SRS259504', 'SRS259505', 'SRS259506', 'SRS259507', 'SRS259508', 'SRS259509', 'SRS259510', 'SRS259511', 'SRS259512', 'SRS259513', 'SRS259514', 'SRS259515', 'SRS259516', 'SRS259517', 'SRS259518', 'SRS259519', 'SRS259520', 'SRS259521', 'SRS259522', 'SRS259523', 'SRS259524', 'SRS259525', 'SRS259526', 'SRS259527', 'SRS259528', 'SRS259529', 'SRS259530', 'SRS259531', 'SRS259532', 'SRS259533', 'SRS259534', 'SRS259535', 'SRS259536', 'SRS259537', 'SRS259538', 'SRS259539', 'SRS259540', 'SRS259541', 'SRS259542', 'SRS259543', 'SRS259544', 'SRS259545', 'SRS259546', 'SRS259547', 'SRS259548', 'SRS259549', 'SRS259550', 'SRS259551', 'SRS259552', 'SRS259553', 'SRS259554', 'SRS259555', 'SRS259556', 'SRS259557', 'SRS259558', 'SRS259559', 'SRS259560', 'SRS259561', 'SRS259562', 'SRS259563', 'SRS259564', 'SRS259565', 'SRS259566', 'SRS259567', 'SRS259568', 'SRS259569', 'SRS259570', 'SRS259571', 'SRS259572', 'SRS259573', 'SRS259574', 'SRS259575', 'SRS259576', 'SRS259577', 'SRS259578', 'SRS294812', 'SRS294813', 'SRS294814', 'SRS294815', 'SRS294816', 'SRS294817', 'SRS294818', 'SRS294819', 'SRS294820', 'SRS294821', 'SRS294822', 'SRS294823', 'SRS294824', 'SRS294825', 'SRS294826', 'SRS294827', 'SRS294828', 'SRS294829', 'SRS294830', 'SRS294831', 'SRS294832', 'SRS294833', 'SRS294834', 'SRS294835', 'SRS294836', 'SRS294837', 'SRS294838', 'SRS294839', 'SRS294840', 'SRS294841', 'SRS294842', 'SRS294843', 'SRS294844', 'SRS294845', 'SRS294846', 'SRS294847', 'SRS294848', 'SRS294849', 'SRS294850', 'SRS294851', 'SRS294852', 'SRS294853', 'SRS294854', 'SRS294855', 'SRS294856', 'SRS294857', 'SRS294858', 'SRS294859', 'SRS294860', 'SRS294861', 'SRS294862', 'SRS294863', 'SRS294864', 'SRS294865', 'SRS294866', 'SRS294867', 'SRS294868', 'SRS294869', 'SRS294870', 'SRS294871', 'SRS294872', 'SRS294873', 'SRS294874', 'SRS294875', 'SRS294876', 'SRS294877', 'SRS294878', 'SRS294879', 'SRS294880', 'SRS294881', 'SRS294882', 'SRS294883', 'SRS294884', 'SRS294885', 'SRS294886', 'SRS294887', 'SRS294888', 'SRS294889', 'SRS294890', 'SRS294891', 'SRS294892', 'SRS294893', 'SRS294894', 'SRS294895', 'SRS294896', 'SRS294897', 'SRS294898', 'SRS294899', 'SRS294900', 'SRS294901', 'SRS294902', 'SRS294903', 'SRS294904', 'SRS294905', 'SRS294906', 'SRS294907', 'SRS294908', 'SRS294909', 'SRS294910', 'SRS294911', 'SRS294912', 'SRS294913', 'SRS294914', 'SRS294915', 'SRS294916', 'SRS294917', 'SRS294918', 'SRS294919', 'SRS294920', 'SRS294921', 'SRS294922', 'SRS294923', 'SRS294924', 'SRS294925', 'SRS294926', 'SRS294927', 'SRS294928', 'SRS294929', 'SRS294930', 'SRS294931', 'SRS294932', 'SRS294933', 'SRS294934', 'SRS294935', 'SRS294936', 'SRS294937', 'SRS294938', 'SRS294939', 'SRS294940', 'SRS294941', 'SRS294942', 'SRS294943', 'SRS294944', 'SRS294945', 'SRS294946', 'SRS294947', 'SRS294948', 'SRS294949', 'SRS294950', 'SRS294951', 'SRS294952', 'SRS294953', 'SRS294954', 'SRS294955', 'SRS294956', 'SRS294957', 'SRS294958', 'SRS294959', 'SRS294960', 'SRS294961', 'SRS294962', 'SRS294963', 'SRS294964', 'SRS294965', 'SRS294966', 'SRS294967', 'SRS294968', 'SRS294969', 'SRS294970', 'SRS294971', 'SRS294972', 'SRS294973', 'SRS294974', 'SRS294975', 'SRS294976', 'SRS294977', 'SRS294978', 'SRS294979', 'SRS294980', 'SRS294981', 'SRS294982', 'SRS294983', 'SRS294984', 'SRS294985', 'SRS294986', 'SRS294987', 'SRS294988', 'SRS294989', 'SRS294990', 'SRS294991', 'SRS294992', 'SRS294993', 'SRS294994', 'SRS294995', 'SRS294996', 'SRS294997', 'SRS294998', 'SRS294999', 'SRS295000', 'SRS295001', 'SRS295002', 'SRS295003', 'SRS295004', 'SRS295005', 'SRS295006', 'SRS295007', 'SRS295008', 'SRS295009', 'SRS295010', 'SRS295011', 'SRS295012', 'SRS295013', 'SRS295014', 'SRS295015', 'SRS295016', 'SRS295017', 'SRS295018', 'SRS295019', 'SRS295020', 'SRS295021', 'SRS295022', 'SRS295023', 'SRS295024', 'SRS295025', 'SRS295026', 'SRS295027', 'SRS295028', 'SRS295029']
# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# opens xml file and finds the metadata id and the SRR accession, and then adds them to a dictionary
metalist = ''
for acc in acclist:
    url = 'https://www.ebi.ac.uk/ena/data/view/' + acc + '&display=xml'
    html = urllib.request.urlopen(url, context=ctx).read()
    tree = ET.fromstring(html)
    metaid = tree.find('SAMPLE/IDENTIFIERS/SUBMITTER_ID').text
    metaid = metaid[4:]
    lst = tree.findall('SAMPLE/SAMPLE_LINKS/SAMPLE_LINK/XREF_LINK')
    for item in lst:
        temp = item.find('ID').text
        if 'SRR' in temp:
            SRR = temp
    metalist = metalist + metaid + '\t' + SRR + '\n'
print(metalist)
fout = open('metapairs.txt', 'w')
fout.write(metalist)
