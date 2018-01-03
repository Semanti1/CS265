#ifndef __KS_PLAY_EXCEPT_
#define __KS_PLAY_EXCEPT_

#include <stdexcept>
#include <string>

class brainFart : public std::runtime_error
{
  public:
   brainFart() : std::runtime_error( "brainFarted" ) {}

   brainFart( const std::string & error )
     : std::runtime_error( error ) {}
   
     // Apparently we have more liberty with the const modifier these days:
   // brainFart( std::string const & error )
   //   : std::runtime_error( error ) {}
} ;

class myWay : public std::exception
{
  private:
   std::string _what ;

  public:
   myWay() : _what( "Default myWay" ) {}
   myWay( const std::string & msg ) : _what( msg ) {}

   virtual const char* what() const throw() { return _what.c_str() ; }

   virtual ~myWay() throw() {} 
} ;

#endif //__KS_PLAY_EXCEPT_

