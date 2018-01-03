#def append( L, e ) :
# t = L # start at beginning
# i=0
# print "hello"+ (string)L[1]
# print t

# while t != [] :
 # t = t[1] # move to next cell
  #i=i+1;
# (t.extend( [ e, [] ] ))
# print t

def search( L, t ) :
  i=0;
  while L[i] :
        if L[i] == t :
             return i;
       # L = L[++i:] # move to next cell
        i=i+1;
        print L;
  return None;

def main():

 L=[1,2,3];
 k= search(L,2);
 print k;

#if __name__ == "__main__" :
main()

