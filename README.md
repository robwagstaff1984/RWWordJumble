Coding challenge for an interview

WORD JUMBLE SOLVER:
The program should accept a string as input, and then return a list of words that can be created using the submitted letters.  For example, on the input "dog", the program should return a set of words including "god", "do", and "go".


 Discussion:
    This algorithm creates an int array of length 26 to represent the frequency of letters occuring for a particular word. A word is a 'sub-anagram' of another word if the letter frequencies for the first word are less than or equal to the letter frequencies of another word. e.g. kite is a sub-anagram of kitten
    
    Word source: A deduplicated and lowercased version of the words file available on all unix like machines. 
        (note: single letters are valid words in this word source)
 
    Performance: O(N)
    Each time a word is entered the algorithm visits every item in the Array of valid words and compares letter frequencies.
 
    Performance improvements if given more time:
    Preprocess the Array of valid words to create a directed acyclic graph of sub-anagram relationship.
    Each node will contain a list of exact letter count anagagrams and children who are sub-anagrams of the parent.
 
    Then finding all the anagrams would be as quick as searching for the top node and recursively printing all the sub-anagrams
 