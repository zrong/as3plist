/*
 * Licensed under the MIT License
 * 
 * Copyright (c) 2008 Daisuke Yanagi
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.zengrong.file.plist
{
/**
 *	Property List Boolean 
 * @author dai
 * @author zrong(zengrong.net) 2013-09-14
 * 
 */	
public class PBoolean extends PlistElement implements ISimplePlistElement
{
	public static function parse($x:XML):PBoolean
	{
		var __element:PBoolean = new PBoolean();
		__element.xml = $x;
		return __element;
	}
	
	public function PBoolean($value:Boolean=false)
	{
		init($value ? PlistTags.TRUE : PlistTags.FALSE);
	}
	
	override public function get object():*
	{
		if(isDirty || !data)
		{
			if(x.name()==PlistTags.TRUE)
			{
				data = true;
			}
			else if(x.name()==PlistTags.FALSE)
			{
				data = false;
			}
			isDirty = false;
		}
		return data;
	}
	
	override public function set object($value:*):void
	{
		if($value is Boolean)
		{
			if($value as Boolean)
				x.setName(PlistTags.TRUE);
			else
				x.setName(PlistTags.FALSE);
		}
		else
		{
			object = Boolean($value);
		}
		isDirty = true;
	}
}
}