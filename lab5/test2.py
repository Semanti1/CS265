def main():
        L = [24, None]

        t = [13, None]
        t[1] = L
        L = t
        print L
        print t
        t = [28, None]
        t[1] = L[1]
        L[1] = t
        print L
        print t
        t = [3, None]
        p = L
        print L
        print t
        while p != None :
                q = p
                print q
                print t
                print p
                print L
                p = p[1]
        q[0]=7
        print L
        print t
        print q  
        print p 
        if p == L :
                L = t
                print L
        else :
                print L
                q[1] = t
                print L
                print t
                print p
                print q

        print L
main();
