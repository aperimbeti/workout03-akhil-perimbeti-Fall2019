#CLEAN DATA

table_citations1=table1[[1]]
long_info1=table1[[2]][1]
citation1=table1[[2]][2]
year1=table1[[2]][3]

table_citations2=table2[[1]]
long_info2=table2[[2]][1]
citation2=table2[[2]][2]
year2=table2[[2]][3]

info_link1=rawdat1%>% html_nodes(xpath='//*[@id="gsc_a_b"]')%>%html_nodes(xpath='tr')%>%html_nodes(xpath='td')
result1=sapply(html_children(info_link1),html_text)
result1=result1[result1!='*']

info_link2=rawdat2%>% html_nodes(xpath='//*[@id="gsc_a_b"]')%>%html_nodes(xpath='tr')%>%html_nodes(xpath='td')
result2=sapply(html_children(info_link2),html_text)
result2=result2[result2!='*']


df1_citations=data.frame(article_title=result1[seq(1,length(result1),5)],
                         
                         author=result1[seq(2,length(result1),5)],
                         journal=result1[seq(3,length(result1),5)],
                         citations=result1[seq(4,length(result1),5)],
                         year=result1[seq(5,length(result1),5)])


df2_citations =data.frame(article_title=result2[seq(1,length(result2),5)],
                          author=result2[seq(2,length(result2),5)],
                          journal=result2[seq(3,length(result2),5)],
                          citations=result2[seq(4,length(result2),5)],
                          year=result2[seq(5,length(result2),5)])

df1_citations
df2_citations
final_df=rbind(df1_citations,df2_citations)
final_df