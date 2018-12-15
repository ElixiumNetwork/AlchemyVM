defmodule WaspVM.Decoder.StartSectionParser do
  alias WaspVM.LEB128

   def parse(module) do
     {index, _entries} =
       module.sections
       |> Map.get(8)
       |> LEB128.decode()

     Map.put(module, :start, index)
   end

end