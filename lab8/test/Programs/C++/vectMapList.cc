// vectMapList.cc - an example of using the STL vectors, maps, and lists
//
// Kurt Schmidt
// 2/05
//
// g++ 3.3.2 on Mandrake Linux 9.2
//
// editor:  80 cols, tabstop=2
//

#include <cstdlib>
	using std::size_t;
#include <string>
	using std::string;
#include <iostream>
	using std::ostream;
	using std::cout;
	using std::endl;
#include <iomanip>
	using std::setw;
	using std::left;

#include <vector>
	using std::vector;
#include <map>
	using std::map;
	using std::pair;
#include <list>
	using std::list;
#include <set>
	using std::set;

#include <algorithm>
	using std::random_shuffle;

template <class S>
void printLinCont( ostream &os, S b, S e )
{
	os << "[ ";
	if( b!=e )
	{
		os << *b;
		++b;
	}
	for( ; b!=e; ++b )
		os << ", " << *b;
	os << " ]";
}

template <class S>
void printMap( ostream &os, S b, S e )
{
	os <<  setw( 20 )<< left << "Name" << setw( 5 ) << left << "ID\n";
	os <<  setw( 20 ) << left << "-------------------"
		<< setw( 5 ) << left << "----\n";

	for( ; b!=e; ++b )
	{
		os <<  setw( 20 ) << left << b->first
			<< setw( 5 ) << left << b->second << endl;
	}
}


int main()
{
	cout << "\n#####   Vectors   ######################################\n\n";

	vector<int> v;

	// load vector
	for( int i=10; i<20; ++i )
		v.push_back( i );

	cout << "v is: ";
	printLinCont( cout, v.begin(), v.end() );
	cout << "\nIt has " << v.size() << " elements, indexed 0.."
		<< v.size()-1 << endl << endl;

	cout << "This is v after a single pop_back:\n";
	v.pop_back();
	printLinCont( cout, v.begin(), v.end() );
	cout << "\nIt now has " << v.size() << " elements, indexed 0.."
		<< v.size()-1 << endl << endl;

	cout << "Now, let's shuffle using random_shuffle:\n";
	random_shuffle( v.begin(), v.end() );
	printLinCont( cout, v.begin(), v.end() );
	cout << "\nIt still has " << v.size()
		<< " elements, but in a different order\n\n";

	cout << "\n#####   Lists   ######################################\n\n";

	list<int> l;

	// load list
	for( int i=10; i<20; ++i )
	{
		if( i&1 )	// if odd
			l.push_back( i );
		else
			l.push_front( i );
	}

	cout << "l is: ";
	printLinCont( cout, l.begin(), l.end() );
	cout << "\nIt has " << l.size() << " elements, which are NOT indexed!"
		<< endl << endl;

	cout << "Hey, 5 should come before 13!\n";
	list<int>::iterator p = find( l.begin(), l.end(), 13 );
	l.insert( p, 5 );
	printLinCont( cout, l.begin(), l.end() );
	cout << "\nIt now has " << l.size() << " elements" << endl << endl;

	cout << "\n#####   Maps (associative arrays)   ######################\n\n";

	map< string, int > m;	// (name, ID) pairs

	// load map
	m[ "Kurt" ] = 13;
	// Another way to do the same thing...
	pair< string, int > d( "Ski", 4 );
	m.insert( d );
	m[ "Jaga" ] = 24;
	m[ "Cara" ] = 16;

	cout << "Here's your map:\n";
	printMap( cout, m.begin(), m.end() );
	cout << "\nIt has " << m.size()
		<< " elements.  Note, we got the keys in order, for free!\n\n";

	cout << "Let's look for Waldo's ID!\n";
	cout << "Waldo's ID is: " << m[ "Waldo" ] << endl;
	cout << "\nWhoops!  Waldo wasn't in our array, but he is now:\n";
	printMap( cout, m.begin(), m.end() );

	cout << "Let's remove him from the map, try again:\n";
	m.erase( "Waldo" );

	cout << "\nA better (safe) way:\n";
	map<string,int>::iterator mi = m.find( "Waldo" );
	if( mi==m.end() )
		cout << "I don't have a Waldo";
	else
		cout << "Waldo's ID is " << mi->second;
 	cout << endl	<< endl;

	cout << "Let's look for Jaga's ID!\n";
	mi = m.find( "Jaga" );
	if( mi==m.end() )
		cout << "I don't have an Jaga";
	else
		cout << "Jaga's ID is " << mi->second;
	cout << endl	<< endl;

	cout << "\n#####   Sets   ################################\n\n";

	set< string > s;	// (name, ID) pairs

	// load set
	s.insert( "picture" );
	s.insert( "chair" );
	s.insert( "pen" );
	s.insert( "monitor" );
	s.insert( "bottle" );

	cout << "Here's your set:\n";
	printLinCont( cout, s.begin(), s.end() );
	cout << "\nIt has " << s.size()
		<< " elements.  Like the map, they're sorted, to make it easier to "
		<< "check for membership\n\n";

	set<string>::iterator si;
	si = s.find( "chair" );
	if( si == s.end() )
		cout << "I looked around, and I noticed there wasn't a chair\n";
	else
	{
		cout << "I found a chair, and I took it:\n";
		s.erase( si );
		printLinCont( cout, s.begin(), s.end() );
	}
	cout << endl;



	cout << endl;

	return 0;
}
