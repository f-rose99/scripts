# Import libraries
library("ggplot2")

# Take in strain csv
csv <- "/home/s12846fp/Documents/Analysis/WP2/WP2.1/strains.csv"
Pa_metadata <- read.csv(csv, sep = ",")

# Note want to put title in the middle fo the chart 


summary(Pa_metadata)
# Convert to data frame first
Pa_metadata_summary_df <- as.data.frame(summary(Pa_metadata))

# Then export
write.csv(Pa_metadata_summary_df, "Pa_metadata_summary.csv", row.names = FALSE)

# Assembly Level 
ggplot(Pa_metadata, aes(x = Assembly.Level)) +
  geom_bar(color = "black", fill="lightblue2", width = 0.5) + 
  geom_text(stat = 'count', aes(label = after_stat(count)), vjust = -0.5) +
  ggtitle("Assembly Level of Sequences") +
  theme_minimal() +
  labs(x = "Assembly Level",
       y = "Count")
  ylim(0, 650)
  theme(axis.text.x = element_text(angle = 30, hjust = 0.5))


# Strain Presence 
# This doesn't work, need another way of presenting outside of a graph 
ggplot(Pa_metadata, aes(x = Strain)) +
  geom_bar(fill="lightblue2", width = 0.5) + 
  geom_text(stat = 'count', aes(label = after_stat(count)), vjust = -0.5) +
  ggtitle("Pa Strains") +
  theme_minimal() +
  labs(x = "Strains",
       y = "Count")
  theme(axis.text.x = element_text(angle = 30, hjust = 0.5))


# Gene Number 
summary(Pa_metadata$Number.of.Genes)
ggplot(Pa_metadata, aes(x=Number.of.Genes)) + 
  geom_histogram(binwidth = 50, color="black", fill="lightblue2") +
  ggtitle("Distribution of Number of Genes in Sequences") +
  theme_minimal() +
  labs(x = "Number of Genes ",
       y = "Sample Count")
theme(axis.text.x = element_text(angle = 30, hjust = 0.5))  


# Contig N.50 
summary(Pa_metadata$Contig.n50)
ggplot(Pa_metadata, aes(x=Contig.n50)) + 
  geom_histogram(binwidth = 100000, color="black", fill="lightblue2") +
  ggtitle("Distribution of Contig N50 in Sequences") +
  theme_minimal() +
  labs(x = "Contig N50",
       y = "Sample Count")
theme(axis.text.x = element_text(angle = 30, hjust = 0.5)) 

# plot mean, mode, histogram peak and density peak







