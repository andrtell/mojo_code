[Up](../sort.md)

**External link**

[Wikipedia: Selection sort](https://en.wikipedia.org/wiki/Selection_sort)

**Ascii illustration**

```
SELECTION SORT


 ┌─m─┐                                    i = 0
   3   4   2   1                          while i < len(a) - 1
   i └───────────┘                            min = i
                                              j   = i + 1
 ┌─m─┐                                        while j < len(a)
   3   4   2   1                                  if a[j] < a[min]
   i └─j─────────┘                                    min = j 
                                                  j = j + 1 
 ┌───┐     m                                  if i != min    
   3   4   2   1                                  swap(a[i], a[min])
   i └─────j─────┘                            i = i + 1    
                                             
 ┌───┐         m                         -------------------------------------      
   3   4   2   1                         
   i └─────────j─┘                        Time      comp.   swap
                                           
 ┌───┐                                    worst     O(n²)   O(n)
   1   4   2   3                          average   O(n²)   O(n)
   i └───────────┘                        best      O(n²)   O(1)
                                        
                           i = 0          Space     tot.    aux.
---------------------------------          
                                          worst     O(n)    O(1)
 ┌─────m─┐                              
   1   4   2   3                         -------------------------------------      
       i └───────┘                      
                                          in-place / not stable / not online
 ┌───────┐ m                           
   1   4   2   3                         -------------------------------------        
       i └─j─────┘                      
                                           sorted 
 ┌───────┐ m                              ┌─────────┐
   1   4   2   3                          │ <x ┊ <x │ x ┊ y ┊    ┊ <x ┊     
       i └─────j─┘                                  └────────────────────────
                                         
 ┌───────┐                                ┌──────────────┐     not stable
   1   2   4   3                          │ <x ┊ <x ┊ <x │ y ┊   ┊ x ┊      
       i └───────┘                                       └───────────────────
                                                               not online
                           i = 1  
---------------------------------
                                 
 ┌─────────m─┐                   
   1   2   4   3                 
           i └───┘
             
 ┌───────────┐ m
   1   2   4   3
           i └─j─┘
                
 ┌───────────┐
   1   2   3   4
           i └───┘
            
                           i = 2 
---------------------------------
```
