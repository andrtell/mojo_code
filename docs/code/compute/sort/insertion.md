[Up](../sort.md)

**External links**

[Wikipedia / Insertion sort](https://en.wikipedia.org/wiki/Insertion_sort)


**Ascii illustration**

```
INSERTION SORT


 ┌───┐ j                                 i = 1
   1 < 4   3   2                         while i < len(a)
     └─i─────────┘                           j = i
                                             while j > 0 and a[j] < a[j - 1]
                           i = 1                 swap(a[j], a[j - 1])  
---------------------------------                j = j - 1
                                             i = i + 1
 ┌───────┐ j                               
   1   4 > 3   2                        -------------------------------------     
         └─i─────┘                      
                                         Time      comp.   swap
 ┌───────┐ j                            
   1   3   4   2                         worst     O(n²)   O(n²) 
         └─i─────┘                       average   O(n²)   O(n²)
                                         best      O(n)    O(1)  
 ┌─────j─┐                              
   1 < 3   4   2                         Space     tot.    aux.
         └─i─────┘                      
                                         worst     O(n)    O(1)
                           i = 2         
---------------------------------       -------------------------------------
                                        
 ┌───────────┐ j                         in-place / stable / online
   1   3   4 > 2                        
             └─i─┘                      -------------------------------------
             
 ┌───────────┐ j                        
   1   3   2   4                         sorted 
             └─i─┘                       ┌──────────────┐                 
                                         │ <x ┊ =x ┊ x< │ x ┊ y ┊           
 ┌─────────j─┐                                          └───────────────────
   1   3 > 2   4                        
             └─i─┘                       ┌──────────────────┐ 
                                         │ <x ┊ =x ┊ x ┊ x< │ y ┊           
 ┌─────────j─┐                                  stable      └───────────────
   1   2   3   4                                             online
             └─i─┘
 
 ┌─────j─────┐       
   1 < 2   3   4   
             └─i─┘       
             
                           i = 3
---------------------------------

```
