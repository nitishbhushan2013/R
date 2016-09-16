# Data Frame Examples
# https://www.datacamp.com/community/tutorials/15-easy-solutions-data-frame-problems-r#gs.ayUoYeU


Died.At <- c(22,40,72,41)
Writer.At <- c(16, 18, 36, 36)
First.Name <- I(c("John", "Edgar", "Walt", "Jane"))
Second.Name <- I(c("Doe", "Poe", "Whitman", "Austen"))
Sex <- c("MALE", "MALE", "MALE", "FEMALE")
Date.Of.Death <- as.Date(c("2015-05-10", "1849-10-07", "1892-03-26","1817-07-18"))

writers_df <- data.frame(Died.At,Writer.At,First.Name, Second.Name, Sex , Date.Of.Death  )



str(writers_df)
head(writers_df,1)
tail(writers_df,1)

writers_df
names(writers_df)

#change colname or row name
colnames(writers_df)
rownames(writers_df)

rownames(writers_df)<- c("ID1","ID2","ID3","ID4")
colnames(writers_df) <- c("died@age", "writer@age", "firstName", "secondName", "sex", "death@year")
writers_df

dim(writers_df)
str(writers_df)

nrow(writers_df)
ncol(writers_df)
length(writers_df) # length of row

writers_df



