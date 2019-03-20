#!/bin/bash
# run in directory for project
# edits the fasta headers of a list of files with data from a second list
filelist=(11861_6_55 11861_6_58 11861_6_61 11861_6_63 11861_6_65 12718_7_10 12718_7_13 12718_7_14 12718_7_15 12718_7_17 12718_7_21 12718_7_23 12718_7_24 12718_7_29 12718_7_37 12718_7_39 12718_7_3 12718_7_41 12718_7_46 12718_7_47 12718_7_49 12718_7_50 12718_7_51 12718_7_56 12718_7_59 12718_7_70 12718_7_72 12718_7_73 12718_7_7 12718_7_81 12718_7_84 12718_7_87 12718_7_89 12718_7_92 12718_7_94 12718_7_9 13154_4_43 13414_6_10 13414_6_12 13414_6_14 13414_6_15 13414_6_17 13414_6_20 13414_6_24 13414_6_2 13414_6_32 13414_6_33 13414_6_34 13414_6_37 13414_6_39 13414_6_3 13414_6_41 13414_6_43 13414_6_44 13414_6_47 13414_6_49 13414_6_50 13414_6_53 13414_6_58 13414_6_60 13414_6_66 13414_6_67 13414_6_68 13414_6_70 13414_6_73 13470_2_58 13470_2_62 13470_2_64 13470_2_65 13470_2_67 13470_2_71 13470_2_73 13470_2_75 13470_2_77 13470_2_78 13470_2_81 13470_2_91 13470_2_92 13470_2_93 14207_6_11 14207_6_12 14207_6_13 14207_6_2 14207_6_3 14207_6_9 14207_7_10 14207_7_18 14207_7_1 14207_7_23 14207_7_25 14207_7_27 14207_7_28 14207_7_30 14207_7_32 14207_7_37 14207_7_42 14207_7_43 14207_7_50 14207_7_52 14207_7_54 14207_7_56 14207_7_57 14207_7_59 14207_7_64 14207_7_70 14207_7_75 14207_7_83 14207_7_86 14207_7_87 14207_7_89 14207_7_90 14207_7_95 14207_7_9 14670_1_61 14672_4_4 15841_8_64 15841_8_85 15841_8_88 17138_5_74 17138_5_75 18048_1_69 18048_1_70 18048_1_72 18048_1_93 18048_2_57 18048_2_67 18048_2_82 18048_2_85 18048_2_90 18391_1_11 18391_1_7 20287_6_18 20287_6_22 20287_6_33 20287_6_37 20287_6_4 20287_6_53 20287_6_63 20287_6_6 20287_6_70 20287_6_88 20287_6_9 20298_2_10 20298_2_19 20298_2_1 20298_2_23 20298_2_28 20298_2_29 20298_2_31 20298_2_33 20298_2_3 20298_2_47 20298_2_49 20298_2_4 20298_2_53 20298_2_5 20298_2_67 20298_2_7 20298_3_11 20298_3_12 20298_3_13 20298_3_14 20298_3_17 20298_3_18 20298_3_19 20298_3_1 20298_3_21 20298_3_24 20298_3_25 20298_3_26 20298_3_28 20298_3_2 20298_3_30 20298_3_34 20298_3_35 20298_3_36 20298_3_37 20298_3_39 20298_3_3 20298_3_48 20298_3_4 20298_3_52 20298_3_57 20298_3_58 20298_3_59 20298_3_62 20298_3_63 20298_3_64 20298_3_65 20298_3_66 20298_3_69 20298_3_70 20298_3_71 20298_3_81 20298_3_8 20298_3_9 20427_4_22 20427_4_25 21673_4_12 21673_4_18 21673_4_19 21673_4_22 21673_4_33 21673_4_36 21673_4_37 21673_4_38 21673_4_3 21673_4_43 21673_4_46 21673_4_53 21673_4_55 21673_4_5 21673_4_71 21673_4_77 21673_4_80 21673_4_87 21673_4_91 8080_1_69 8080_1_72 8080_1_73 8080_1_77 8080_1_78 8080_1_80 8080_1_81 8080_1_83 8080_1_93)
metalist=(11861_6_55_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 11861_6_58_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 11861_6_61_Bacteroidetes_Bacteroidia_Bacteroidales_Rikenellaceae_Alistipes 11861_6_63_Bacteroidetes_Bacteroidia_Bacteroidales_Rikenellaceae_Alistipes 11861_6_65_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 12718_7_10_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 12718_7_13_Firmicutes_Bacilli_Bacillales_Staphylococcaceae_Staphylococcus 12718_7_14_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 12718_7_15_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 12718_7_17_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 12718_7_21_Firmicutes_Bacilli_Bacillales_Staphylococcaceae_NA 12718_7_23_Firmicutes_Bacilli_Bacillales_Staphylococcaceae_Staphylococcus 12718_7_24_Firmicutes_Bacilli_Bacillales_Bacillaceae_Bacillus 12718_7_29_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 12718_7_37_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_Butyricimonas 12718_7_39_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 12718_7_3_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Enterobacter 12718_7_41_Firmicutes_Clostridia_Clostridiales_NA_NA 12718_7_46_Actinobacteria_Actinobacteria_Coriobacteriales_Coriobacteriaceae_NA 12718_7_47_Firmicutes_Clostridia_Clostridiales_NA_NA 12718_7_49_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Enterobacter 12718_7_50_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Enterobacter 12718_7_51_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Ruminococcus 12718_7_56_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 12718_7_59_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 12718_7_70_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 12718_7_72_Firmicutes_Clostridia_Clostridiales_NA_NA 12718_7_73_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 12718_7_7_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Enterobacter 12718_7_81_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_NA 12718_7_84_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 12718_7_87_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 12718_7_89_Actinobacteria_Actinobacteria_Coriobacteriales_Coriobacteriaceae_NA 12718_7_92_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 12718_7_94_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 12718_7_9_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 13154_4_43_Firmicutes_Bacilli_Bacillales_Staphylococcaceae_Staphylococcus 13414_6_10_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_NA 13414_6_12_Firmicutes_Negativicutes_Selenomonadales_Veillonellaceae_Selenomonas 13414_6_14_Firmicutes_Clostridia_Clostridiales_NA_NA 13414_6_15_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13414_6_17_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Ruminococcus 13414_6_20_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 13414_6_24_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 13414_6_2_Firmicutes_Clostridia_Clostridiales_NA_NA 13414_6_32_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 13414_6_33_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13414_6_34_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 13414_6_37_Firmicutes_Clostridia_Clostridiales_NA_NA 13414_6_39_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 13414_6_3_Firmicutes_Clostridia_Clostridiales_NA_NA 13414_6_41_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 13414_6_43_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 13414_6_44_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Lachnobacterium 13414_6_47_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Lachnobacterium 13414_6_49_Firmicutes_Bacilli_NA_NA_NA 13414_6_50_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Dorea 13414_6_53_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_Faecalibacterium 13414_6_58_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_NA 13414_6_60_Firmicutes_Clostridia_Clostridiales_NA_NA 13414_6_66_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 13414_6_67_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13414_6_68_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13414_6_70_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13414_6_73_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 13470_2_58_Firmicutes_Clostridia_Clostridiales_NA_NA 13470_2_62_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 13470_2_64_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 13470_2_65_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 13470_2_67_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_Parabacteroides 13470_2_71_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_NA 13470_2_73_Firmicutes_Negativicutes_Selenomonadales_Veillonellaceae_Megasphaera 13470_2_75_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 13470_2_77_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 13470_2_78_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 13470_2_81_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 13470_2_91_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13470_2_92_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 13470_2_93_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 14207_6_11_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_6_12_Bacteroidetes_Bacteroidia_Bacteroidales_Rikenellaceae_Alistipes 14207_6_13_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 14207_6_2_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_NA 14207_6_3_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_NA 14207_6_9_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 14207_7_10_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 14207_7_18_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_1_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Lachnospira 14207_7_23_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 14207_7_25_Actinobacteria_Actinobacteria_Coriobacteriales_Coriobacteriaceae_NA 14207_7_27_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 14207_7_28_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_30_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 14207_7_32_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_37_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Dorea 14207_7_42_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 14207_7_43_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 14207_7_50_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_52_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 14207_7_54_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_56_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_57_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_Ruminococcus 14207_7_59_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_64_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_70_Bacteroidetes_Bacteroidia_Bacteroidales_Rikenellaceae_Alistipes 14207_7_75_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 14207_7_83_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Roseburia 14207_7_86_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_87_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_89_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_90_Firmicutes_Clostridia_Clostridiales_NA_NA 14207_7_95_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 14207_7_9_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Lachnospira 14670_1_61_Firmicutes_Bacilli_Lactobacillales_Enterococcaceae_Enterococcus 14672_4_4_Firmicutes_Bacilli_Bacillales_Exiguobacterium_Exiguobacterium 15841_8_64_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 15841_8_85_Firmicutes_Clostridia_Clostridiales_NA_NA 15841_8_88_Actinobacteria_Actinobacteria_Actinomycetales_Corynebacteriaceae_Corynebacterium 17138_5_74_Proteobacteria_Gammaproteobacteria_Pseudomonadales_Moraxellaceae_Acinetobacter 17138_5_75_Firmicutes_Bacilli_Bacillales_Bacillaceae_Bacillus 18048_1_69_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 18048_1_70_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 18048_1_72_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 18048_1_93_Actinobacteria_Actinobacteria_Bifidobacteriales_Bifidobacteriaceae_Bifidobacterium 18048_2_57_Actinobacteria_Actinobacteria_Coriobacteriales_Coriobacteriaceae_NA 18048_2_67_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 18048_2_82_Firmicutes_Clostridia_Clostridiales_NA_NA 18048_2_85_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 18048_2_90_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_Odoribacter 18391_1_11_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 18391_1_7_Actinobacteria_Actinobacteria_Bifidobacteriales_Bifidobacteriaceae_Bifidobacterium 20287_6_18_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 20287_6_22_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_Ruminococcus 20287_6_33_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Ruminococcus 20287_6_37_Firmicutes_Clostridia_Clostridiales_NA_NA 20287_6_4_Proteobacteria_Betaproteobacteria_Burkholderiales_Alcaligenaceae_Achromobacter 20287_6_53_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 20287_6_63_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 20287_6_6_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Klebsiella 20287_6_70_Actinobacteria_Actinobacteria_Coriobacteriales_Coriobacteriaceae_NA 20287_6_88_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 20287_6_9_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 20298_2_10_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 20298_2_19_Firmicutes_Bacilli_Lactobacillales_Leuconostocaceae_Leuconostoc 20298_2_1_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 20298_2_23_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 20298_2_28_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_2_29_Actinobacteria_Actinobacteria_Actinomycetales_Propionibacteriaceae_Propionimicrobium 20298_2_31_Firmicutes_Negativicutes_Selenomonadales_Veillonellaceae_NA 20298_2_33_Firmicutes_Bacilli_Lactobacillales_Enterococcaceae_Enterococcus 20298_2_3_Actinobacteria_Actinobacteria_Actinomycetales_Micrococcaceae_NA 20298_2_47_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 20298_2_49_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 20298_2_4_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_2_53_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 20298_2_5_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 20298_2_67_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Klebsiella 20298_2_7_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 20298_3_11_Firmicutes_Bacilli_Lactobacillales_Enterococcaceae_Enterococcus 20298_3_12_Firmicutes_Bacilli_Lactobacillales_Enterococcaceae_Enterococcus 20298_3_13_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Klebsiella 20298_3_14_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_NA 20298_3_17_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Citrobacter 20298_3_18_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 20298_3_19_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_NA 20298_3_1_Actinobacteria_Actinobacteria_Actinomycetales_Propionibacteriaceae_Propionibacterium 20298_3_21_Actinobacteria_Actinobacteria_Actinomycetales_Actinomycetaceae_Actinomyces 20298_3_24_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 20298_3_25_Firmicutes_Bacilli_Lactobacillales_Streptococcaceae_Streptococcus 20298_3_26_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 20298_3_28_Firmicutes_Bacilli_Bacillales_Exiguobacterium_Exiguobacterium 20298_3_2_Actinobacteria_Actinobacteria_Bifidobacteriales_Bifidobacteriaceae_Bifidobacterium 20298_3_30_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_NA 20298_3_34_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_3_35_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 20298_3_36_Firmicutes_Clostridia_Clostridiales_Clostridiales_Family_XI_Peptoniphilus 20298_3_37_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Klebsiella 20298_3_39_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_3_3_Firmicutes_Bacilli_Bacillales_Staphylococcaceae_Staphylococcus 20298_3_48_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 20298_3_4_Proteobacteria_Gammaproteobacteria_Enterobacteriales_Enterobacteriaceae_Citrobacter 20298_3_52_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 20298_3_57_Actinobacteria_Actinobacteria_Coriobacteriales_Coriobacteriaceae_NA 20298_3_58_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_3_59_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_3_62_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 20298_3_63_Bacteroidetes_Bacteroidia_Bacteroidales_Rikenellaceae_Alistipes 20298_3_64_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 20298_3_65_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 20298_3_66_Firmicutes_Clostridia_Clostridiales_Clostridiales_Family_XI_Peptoniphilus 20298_3_69_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_NA 20298_3_70_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_NA 20298_3_71_Firmicutes_Clostridia_Clostridiales_NA_NA 20298_3_81_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 20298_3_8_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_NA 20298_3_9_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 20427_4_22_Firmicutes_Bacilli_Lactobacillales_Lactobacillaceae_Lactobacillus 20427_4_25_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Lachnobacterium 21673_4_12_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 21673_4_18_Firmicutes_Clostridia_Clostridiales_NA_NA 21673_4_19_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 21673_4_22_Firmicutes_Clostridia_Clostridiales_Ruminococcaceae_Ruminococcus 21673_4_33_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_Parabacteroides 21673_4_36_Firmicutes_Clostridia_Clostridiales_NA_NA 21673_4_37_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 21673_4_38_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 21673_4_3_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 21673_4_43_Firmicutes_Bacilli_Lactobacillales_Enterococcaceae_Enterococcus 21673_4_46_Bacteroidetes_Bacteroidia_Bacteroidales_Bacteroidaceae_Bacteroides 21673_4_53_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 21673_4_55_Firmicutes_Bacilli_NA_NA_NA 21673_4_5_Bacteroidetes_Bacteroidia_Bacteroidales_Porphyromonadaceae_Barnesiella 21673_4_71_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 21673_4_77_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 21673_4_80_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 21673_4_87_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Dorea 21673_4_91_Firmicutes_Bacilli_Bacillales_Bacillaceae_Bacillus 8080_1_69_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA 8080_1_72_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_Blautia 8080_1_73_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 8080_1_77_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 8080_1_78_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 8080_1_80_Tenericutes_Mollicutes_Erysipelotrichales_Erysipelotrichaceae_Solobacterium 8080_1_81_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 8080_1_83_Firmicutes_Clostridia_Clostridiales_Peptostreptococcaceae_Clostridium 8080_1_93_Firmicutes_Clostridia_Clostridiales_Lachnospiraceae_NA GCF_000010185_Firmicutes_Clostridia_Clostridiales_Clostridiales_Family_XI_Finegoldia)

for index in ${!filelist[*]}; do
  file=${filelist[$index]}
  meta=${metalist[$index]}
  #file+='.fa'
  #gunzip $file
  uzfile=${filelist[$index]}
  uzfile+='.fa'
  newfile='/Volumes/data/gutDB/genomes/'
  newfile+=$uzfile
  sed  "s/>/>$meta\_/" $uzfile > $newfile


  #echo "**** ${filelist[$index]} **** ${metalist[$index]} ****"
done

#file=${filelist[0]}
#meta=${metalist[0]}
#file+='.fa'
#gunzip $file
#uzfile=${filelist[0]}
#uzfile+='.fa'
#awk 'sub(/NODE_/, "test"); 0' $uzfile
#sed  "s/>/>$meta\_/" $file > /Users/benjoris/Desktop/PhD/Coding_Projects/test3.fa
