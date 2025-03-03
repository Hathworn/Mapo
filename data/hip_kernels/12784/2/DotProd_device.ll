; ModuleID = '../data/hip_kernels/12784/2/main.cu'
source_filename = "../data/hip_kernels/12784/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@_ZZ7DotProdPiS_S_E4temp = internal unnamed_addr addrspace(3) global [10 x i32] undef, align 16
@.str = private unnamed_addr addrspace(4) constant [15 x i8] c"Block ID :%d:\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [16 x i8] c"Block Dim :%d:\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [16 x i8] c"Theard ID :%d:\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [9 x i8] c"Temp:%d\0A\00", align 1
@.str.4 = private unnamed_addr addrspace(4) constant [12 x i8] c"\0ASUM[%d]:%d\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z7DotProdPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 24
  %15 = bitcast i8 addrspace(4)* %14 to i64 addrspace(4)*
  %16 = load i64, i64 addrspace(4)* %15, align 8, !tbaa !7
  %17 = inttoptr i64 %16 to i8 addrspace(1)*
  %18 = addrspacecast i8 addrspace(1)* %17 to i8*
  %19 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %20 = extractelement <2 x i64> %19, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %21, label %25

21:                                               ; preds = %3
  %22 = and i64 %20, -225
  %23 = or i64 %22, 32
  %24 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %23, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %466

25:                                               ; preds = %3
  %26 = and i64 %20, 2
  %27 = and i64 %20, -3
  %28 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %27, i64 0
  br label %29

29:                                               ; preds = %455, %25
  %30 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str to [15 x i8]*) to i64)), i64 1))), %25 ], [ %463, %455 ]
  %31 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0), %25 ], [ %464, %455 ]
  %32 = phi <2 x i64> [ %28, %25 ], [ %462, %455 ]
  %33 = icmp ugt i64 %30, 56
  %34 = extractelement <2 x i64> %32, i64 0
  %35 = or i64 %34, %26
  %36 = insertelement <2 x i64> poison, i64 %35, i64 0
  %37 = select i1 %33, <2 x i64> %32, <2 x i64> %36
  %38 = tail call i64 @llvm.umin.i64(i64 %30, i64 56)
  %39 = trunc i64 %38 to i32
  %40 = extractelement <2 x i64> %37, i64 0
  %41 = icmp ugt i32 %39, 7
  br i1 %41, label %44, label %42

42:                                               ; preds = %29
  %43 = icmp eq i32 %39, 0
  br i1 %43, label %97, label %84

44:                                               ; preds = %29
  %45 = load i8, i8 addrspace(4)* %31, align 1, !tbaa !11
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 1
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !11
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 8
  %51 = or i64 %50, %46
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 2
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !11
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 16
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 3
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !11
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 24
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 4
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !11
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 32
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 5
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !11
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 40
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 6
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !11
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 48
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 7
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !11
  %79 = zext i8 %78 to i64
  %80 = shl nuw i64 %79, 56
  %81 = or i64 %76, %80
  %82 = add nsw i32 %39, -8
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 8
  br label %97

84:                                               ; preds = %42, %84
  %85 = phi i32 [ %95, %84 ], [ 0, %42 ]
  %86 = phi i64 [ %94, %84 ], [ 0, %42 ]
  %87 = zext i32 %85 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 %87
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !11
  %90 = zext i8 %89 to i64
  %91 = shl i32 %85, 3
  %92 = zext i32 %91 to i64
  %93 = shl nuw i64 %90, %92
  %94 = or i64 %93, %86
  %95 = add nuw nsw i32 %85, 1
  %96 = icmp eq i32 %95, %39
  br i1 %96, label %97, label %84, !llvm.loop !12

97:                                               ; preds = %84, %44, %42
  %98 = phi i8 addrspace(4)* [ %83, %44 ], [ %31, %42 ], [ %31, %84 ]
  %99 = phi i32 [ %82, %44 ], [ 0, %42 ], [ 0, %84 ]
  %100 = phi i64 [ %81, %44 ], [ 0, %42 ], [ %94, %84 ]
  %101 = icmp ugt i32 %99, 7
  br i1 %101, label %104, label %102

102:                                              ; preds = %97
  %103 = icmp eq i32 %99, 0
  br i1 %103, label %157, label %144

104:                                              ; preds = %97
  %105 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !11
  %106 = zext i8 %105 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 1
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !11
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 8
  %111 = or i64 %110, %106
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 2
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !11
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 16
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 3
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !11
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 24
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 4
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !11
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 32
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 5
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !11
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 40
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 6
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !11
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 48
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 7
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !11
  %139 = zext i8 %138 to i64
  %140 = shl nuw i64 %139, 56
  %141 = or i64 %136, %140
  %142 = add nsw i32 %99, -8
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 8
  br label %157

144:                                              ; preds = %102, %144
  %145 = phi i32 [ %155, %144 ], [ 0, %102 ]
  %146 = phi i64 [ %154, %144 ], [ 0, %102 ]
  %147 = zext i32 %145 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 %147
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !11
  %150 = zext i8 %149 to i64
  %151 = shl i32 %145, 3
  %152 = zext i32 %151 to i64
  %153 = shl nuw i64 %150, %152
  %154 = or i64 %153, %146
  %155 = add nuw nsw i32 %145, 1
  %156 = icmp eq i32 %155, %99
  br i1 %156, label %157, label %144

157:                                              ; preds = %144, %104, %102
  %158 = phi i8 addrspace(4)* [ %143, %104 ], [ %98, %102 ], [ %98, %144 ]
  %159 = phi i32 [ %142, %104 ], [ 0, %102 ], [ 0, %144 ]
  %160 = phi i64 [ %141, %104 ], [ 0, %102 ], [ %154, %144 ]
  %161 = icmp ugt i32 %159, 7
  br i1 %161, label %164, label %162

162:                                              ; preds = %157
  %163 = icmp eq i32 %159, 0
  br i1 %163, label %217, label %204

164:                                              ; preds = %157
  %165 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !11
  %166 = zext i8 %165 to i64
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 1
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !11
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 8
  %171 = or i64 %170, %166
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 2
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !11
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 16
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 3
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !11
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 24
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 4
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !11
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 32
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 5
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !11
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 40
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 6
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !11
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 48
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 7
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !11
  %199 = zext i8 %198 to i64
  %200 = shl nuw i64 %199, 56
  %201 = or i64 %196, %200
  %202 = add nsw i32 %159, -8
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 8
  br label %217

204:                                              ; preds = %162, %204
  %205 = phi i32 [ %215, %204 ], [ 0, %162 ]
  %206 = phi i64 [ %214, %204 ], [ 0, %162 ]
  %207 = zext i32 %205 to i64
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 %207
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !11
  %210 = zext i8 %209 to i64
  %211 = shl i32 %205, 3
  %212 = zext i32 %211 to i64
  %213 = shl nuw i64 %210, %212
  %214 = or i64 %213, %206
  %215 = add nuw nsw i32 %205, 1
  %216 = icmp eq i32 %215, %159
  br i1 %216, label %217, label %204

217:                                              ; preds = %204, %164, %162
  %218 = phi i8 addrspace(4)* [ %203, %164 ], [ %158, %162 ], [ %158, %204 ]
  %219 = phi i32 [ %202, %164 ], [ 0, %162 ], [ 0, %204 ]
  %220 = phi i64 [ %201, %164 ], [ 0, %162 ], [ %214, %204 ]
  %221 = icmp ugt i32 %219, 7
  br i1 %221, label %224, label %222

222:                                              ; preds = %217
  %223 = icmp eq i32 %219, 0
  br i1 %223, label %277, label %264

224:                                              ; preds = %217
  %225 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !11
  %226 = zext i8 %225 to i64
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 1
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !11
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 8
  %231 = or i64 %230, %226
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 2
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !11
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 16
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 3
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !11
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 24
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 4
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !11
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 32
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 5
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !11
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 40
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 6
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !11
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 48
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 7
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !11
  %259 = zext i8 %258 to i64
  %260 = shl nuw i64 %259, 56
  %261 = or i64 %256, %260
  %262 = add nsw i32 %219, -8
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 8
  br label %277

264:                                              ; preds = %222, %264
  %265 = phi i32 [ %275, %264 ], [ 0, %222 ]
  %266 = phi i64 [ %274, %264 ], [ 0, %222 ]
  %267 = zext i32 %265 to i64
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 %267
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !11
  %270 = zext i8 %269 to i64
  %271 = shl i32 %265, 3
  %272 = zext i32 %271 to i64
  %273 = shl nuw i64 %270, %272
  %274 = or i64 %273, %266
  %275 = add nuw nsw i32 %265, 1
  %276 = icmp eq i32 %275, %219
  br i1 %276, label %277, label %264

277:                                              ; preds = %264, %224, %222
  %278 = phi i8 addrspace(4)* [ %263, %224 ], [ %218, %222 ], [ %218, %264 ]
  %279 = phi i32 [ %262, %224 ], [ 0, %222 ], [ 0, %264 ]
  %280 = phi i64 [ %261, %224 ], [ 0, %222 ], [ %274, %264 ]
  %281 = icmp ugt i32 %279, 7
  br i1 %281, label %284, label %282

282:                                              ; preds = %277
  %283 = icmp eq i32 %279, 0
  br i1 %283, label %337, label %324

284:                                              ; preds = %277
  %285 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !11
  %286 = zext i8 %285 to i64
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 1
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !11
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 8
  %291 = or i64 %290, %286
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 2
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !11
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 16
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 3
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !11
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 24
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 4
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !11
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 32
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 5
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !11
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 40
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 6
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !11
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 48
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 7
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !11
  %319 = zext i8 %318 to i64
  %320 = shl nuw i64 %319, 56
  %321 = or i64 %316, %320
  %322 = add nsw i32 %279, -8
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 8
  br label %337

324:                                              ; preds = %282, %324
  %325 = phi i32 [ %335, %324 ], [ 0, %282 ]
  %326 = phi i64 [ %334, %324 ], [ 0, %282 ]
  %327 = zext i32 %325 to i64
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 %327
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !11
  %330 = zext i8 %329 to i64
  %331 = shl i32 %325, 3
  %332 = zext i32 %331 to i64
  %333 = shl nuw i64 %330, %332
  %334 = or i64 %333, %326
  %335 = add nuw nsw i32 %325, 1
  %336 = icmp eq i32 %335, %279
  br i1 %336, label %337, label %324

337:                                              ; preds = %324, %284, %282
  %338 = phi i8 addrspace(4)* [ %323, %284 ], [ %278, %282 ], [ %278, %324 ]
  %339 = phi i32 [ %322, %284 ], [ 0, %282 ], [ 0, %324 ]
  %340 = phi i64 [ %321, %284 ], [ 0, %282 ], [ %334, %324 ]
  %341 = icmp ugt i32 %339, 7
  br i1 %341, label %344, label %342

342:                                              ; preds = %337
  %343 = icmp eq i32 %339, 0
  br i1 %343, label %397, label %384

344:                                              ; preds = %337
  %345 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !11
  %346 = zext i8 %345 to i64
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 1
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !11
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 8
  %351 = or i64 %350, %346
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 2
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !11
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 16
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 3
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !11
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 24
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 4
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !11
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 32
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 5
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !11
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 40
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 6
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !11
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 48
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 7
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !11
  %379 = zext i8 %378 to i64
  %380 = shl nuw i64 %379, 56
  %381 = or i64 %376, %380
  %382 = add nsw i32 %339, -8
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 8
  br label %397

384:                                              ; preds = %342, %384
  %385 = phi i32 [ %395, %384 ], [ 0, %342 ]
  %386 = phi i64 [ %394, %384 ], [ 0, %342 ]
  %387 = zext i32 %385 to i64
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 %387
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !11
  %390 = zext i8 %389 to i64
  %391 = shl i32 %385, 3
  %392 = zext i32 %391 to i64
  %393 = shl nuw i64 %390, %392
  %394 = or i64 %393, %386
  %395 = add nuw nsw i32 %385, 1
  %396 = icmp eq i32 %395, %339
  br i1 %396, label %397, label %384

397:                                              ; preds = %384, %344, %342
  %398 = phi i8 addrspace(4)* [ %383, %344 ], [ %338, %342 ], [ %338, %384 ]
  %399 = phi i32 [ %382, %344 ], [ 0, %342 ], [ 0, %384 ]
  %400 = phi i64 [ %381, %344 ], [ 0, %342 ], [ %394, %384 ]
  %401 = icmp ugt i32 %399, 7
  br i1 %401, label %404, label %402

402:                                              ; preds = %397
  %403 = icmp eq i32 %399, 0
  br i1 %403, label %455, label %442

404:                                              ; preds = %397
  %405 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !11
  %406 = zext i8 %405 to i64
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 1
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !11
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 8
  %411 = or i64 %410, %406
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 2
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !11
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 16
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 3
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !11
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 24
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 4
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !11
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 32
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 5
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !11
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 40
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 6
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !11
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 48
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 7
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !11
  %439 = zext i8 %438 to i64
  %440 = shl nuw i64 %439, 56
  %441 = or i64 %436, %440
  br label %455

442:                                              ; preds = %402, %442
  %443 = phi i32 [ %453, %442 ], [ 0, %402 ]
  %444 = phi i64 [ %452, %442 ], [ 0, %402 ]
  %445 = zext i32 %443 to i64
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 %445
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !11
  %448 = zext i8 %447 to i64
  %449 = shl i32 %443, 3
  %450 = zext i32 %449 to i64
  %451 = shl nuw i64 %448, %450
  %452 = or i64 %451, %444
  %453 = add nuw nsw i32 %443, 1
  %454 = icmp eq i32 %453, %399
  br i1 %454, label %455, label %442

455:                                              ; preds = %442, %404, %402
  %456 = phi i64 [ %441, %404 ], [ 0, %402 ], [ %452, %442 ]
  %457 = shl nuw nsw i64 %38, 2
  %458 = add nuw nsw i64 %457, 28
  %459 = and i64 %458, 480
  %460 = and i64 %40, -225
  %461 = or i64 %460, %459
  %462 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %461, i64 noundef %100, i64 noundef %160, i64 noundef %220, i64 noundef %280, i64 noundef %340, i64 noundef %400, i64 noundef %456) #11
  %463 = sub i64 %30, %38
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 %38
  %465 = icmp eq i64 %463, 0
  br i1 %465, label %466, label %29

466:                                              ; preds = %455, %21
  %467 = phi <2 x i64> [ %24, %21 ], [ %462, %455 ]
  %468 = extractelement <2 x i64> %467, i64 0
  %469 = zext i32 %10 to i64
  %470 = and i64 %468, -227
  %471 = or i64 %470, 34
  %472 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %471, i64 noundef %469, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %474 = extractelement <2 x i64> %473, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %475, label %479

475:                                              ; preds = %466
  %476 = and i64 %474, -225
  %477 = or i64 %476, 32
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %477, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %920

479:                                              ; preds = %466
  %480 = and i64 %474, 2
  %481 = and i64 %474, -3
  %482 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %481, i64 0
  br label %483

483:                                              ; preds = %909, %479
  %484 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.1 to [16 x i8]*) to i64)), i64 1))), %479 ], [ %917, %909 ]
  %485 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %479 ], [ %918, %909 ]
  %486 = phi <2 x i64> [ %482, %479 ], [ %916, %909 ]
  %487 = icmp ugt i64 %484, 56
  %488 = extractelement <2 x i64> %486, i64 0
  %489 = or i64 %488, %480
  %490 = insertelement <2 x i64> poison, i64 %489, i64 0
  %491 = select i1 %487, <2 x i64> %486, <2 x i64> %490
  %492 = tail call i64 @llvm.umin.i64(i64 %484, i64 56)
  %493 = trunc i64 %492 to i32
  %494 = extractelement <2 x i64> %491, i64 0
  %495 = icmp ugt i32 %493, 7
  br i1 %495, label %498, label %496

496:                                              ; preds = %483
  %497 = icmp eq i32 %493, 0
  br i1 %497, label %551, label %538

498:                                              ; preds = %483
  %499 = load i8, i8 addrspace(4)* %485, align 1, !tbaa !11
  %500 = zext i8 %499 to i64
  %501 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 1
  %502 = load i8, i8 addrspace(4)* %501, align 1, !tbaa !11
  %503 = zext i8 %502 to i64
  %504 = shl nuw nsw i64 %503, 8
  %505 = or i64 %504, %500
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 2
  %507 = load i8, i8 addrspace(4)* %506, align 1, !tbaa !11
  %508 = zext i8 %507 to i64
  %509 = shl nuw nsw i64 %508, 16
  %510 = or i64 %505, %509
  %511 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 3
  %512 = load i8, i8 addrspace(4)* %511, align 1, !tbaa !11
  %513 = zext i8 %512 to i64
  %514 = shl nuw nsw i64 %513, 24
  %515 = or i64 %510, %514
  %516 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 4
  %517 = load i8, i8 addrspace(4)* %516, align 1, !tbaa !11
  %518 = zext i8 %517 to i64
  %519 = shl nuw nsw i64 %518, 32
  %520 = or i64 %515, %519
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 5
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !11
  %523 = zext i8 %522 to i64
  %524 = shl nuw nsw i64 %523, 40
  %525 = or i64 %520, %524
  %526 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 6
  %527 = load i8, i8 addrspace(4)* %526, align 1, !tbaa !11
  %528 = zext i8 %527 to i64
  %529 = shl nuw nsw i64 %528, 48
  %530 = or i64 %525, %529
  %531 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 7
  %532 = load i8, i8 addrspace(4)* %531, align 1, !tbaa !11
  %533 = zext i8 %532 to i64
  %534 = shl nuw i64 %533, 56
  %535 = or i64 %530, %534
  %536 = add nsw i32 %493, -8
  %537 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 8
  br label %551

538:                                              ; preds = %496, %538
  %539 = phi i32 [ %549, %538 ], [ 0, %496 ]
  %540 = phi i64 [ %548, %538 ], [ 0, %496 ]
  %541 = zext i32 %539 to i64
  %542 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 %541
  %543 = load i8, i8 addrspace(4)* %542, align 1, !tbaa !11
  %544 = zext i8 %543 to i64
  %545 = shl i32 %539, 3
  %546 = zext i32 %545 to i64
  %547 = shl nuw i64 %544, %546
  %548 = or i64 %547, %540
  %549 = add nuw nsw i32 %539, 1
  %550 = icmp eq i32 %549, %493
  br i1 %550, label %551, label %538, !llvm.loop !12

551:                                              ; preds = %538, %498, %496
  %552 = phi i8 addrspace(4)* [ %537, %498 ], [ %485, %496 ], [ %485, %538 ]
  %553 = phi i32 [ %536, %498 ], [ 0, %496 ], [ 0, %538 ]
  %554 = phi i64 [ %535, %498 ], [ 0, %496 ], [ %548, %538 ]
  %555 = icmp ugt i32 %553, 7
  br i1 %555, label %558, label %556

556:                                              ; preds = %551
  %557 = icmp eq i32 %553, 0
  br i1 %557, label %611, label %598

558:                                              ; preds = %551
  %559 = load i8, i8 addrspace(4)* %552, align 1, !tbaa !11
  %560 = zext i8 %559 to i64
  %561 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 1
  %562 = load i8, i8 addrspace(4)* %561, align 1, !tbaa !11
  %563 = zext i8 %562 to i64
  %564 = shl nuw nsw i64 %563, 8
  %565 = or i64 %564, %560
  %566 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 2
  %567 = load i8, i8 addrspace(4)* %566, align 1, !tbaa !11
  %568 = zext i8 %567 to i64
  %569 = shl nuw nsw i64 %568, 16
  %570 = or i64 %565, %569
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 3
  %572 = load i8, i8 addrspace(4)* %571, align 1, !tbaa !11
  %573 = zext i8 %572 to i64
  %574 = shl nuw nsw i64 %573, 24
  %575 = or i64 %570, %574
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 4
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !11
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 32
  %580 = or i64 %575, %579
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 5
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !11
  %583 = zext i8 %582 to i64
  %584 = shl nuw nsw i64 %583, 40
  %585 = or i64 %580, %584
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 6
  %587 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !11
  %588 = zext i8 %587 to i64
  %589 = shl nuw nsw i64 %588, 48
  %590 = or i64 %585, %589
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 7
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !11
  %593 = zext i8 %592 to i64
  %594 = shl nuw i64 %593, 56
  %595 = or i64 %590, %594
  %596 = add nsw i32 %553, -8
  %597 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 8
  br label %611

598:                                              ; preds = %556, %598
  %599 = phi i32 [ %609, %598 ], [ 0, %556 ]
  %600 = phi i64 [ %608, %598 ], [ 0, %556 ]
  %601 = zext i32 %599 to i64
  %602 = getelementptr inbounds i8, i8 addrspace(4)* %552, i64 %601
  %603 = load i8, i8 addrspace(4)* %602, align 1, !tbaa !11
  %604 = zext i8 %603 to i64
  %605 = shl i32 %599, 3
  %606 = zext i32 %605 to i64
  %607 = shl nuw i64 %604, %606
  %608 = or i64 %607, %600
  %609 = add nuw nsw i32 %599, 1
  %610 = icmp eq i32 %609, %553
  br i1 %610, label %611, label %598

611:                                              ; preds = %598, %558, %556
  %612 = phi i8 addrspace(4)* [ %597, %558 ], [ %552, %556 ], [ %552, %598 ]
  %613 = phi i32 [ %596, %558 ], [ 0, %556 ], [ 0, %598 ]
  %614 = phi i64 [ %595, %558 ], [ 0, %556 ], [ %608, %598 ]
  %615 = icmp ugt i32 %613, 7
  br i1 %615, label %618, label %616

616:                                              ; preds = %611
  %617 = icmp eq i32 %613, 0
  br i1 %617, label %671, label %658

618:                                              ; preds = %611
  %619 = load i8, i8 addrspace(4)* %612, align 1, !tbaa !11
  %620 = zext i8 %619 to i64
  %621 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 1
  %622 = load i8, i8 addrspace(4)* %621, align 1, !tbaa !11
  %623 = zext i8 %622 to i64
  %624 = shl nuw nsw i64 %623, 8
  %625 = or i64 %624, %620
  %626 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 2
  %627 = load i8, i8 addrspace(4)* %626, align 1, !tbaa !11
  %628 = zext i8 %627 to i64
  %629 = shl nuw nsw i64 %628, 16
  %630 = or i64 %625, %629
  %631 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 3
  %632 = load i8, i8 addrspace(4)* %631, align 1, !tbaa !11
  %633 = zext i8 %632 to i64
  %634 = shl nuw nsw i64 %633, 24
  %635 = or i64 %630, %634
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 4
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !11
  %638 = zext i8 %637 to i64
  %639 = shl nuw nsw i64 %638, 32
  %640 = or i64 %635, %639
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 5
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !11
  %643 = zext i8 %642 to i64
  %644 = shl nuw nsw i64 %643, 40
  %645 = or i64 %640, %644
  %646 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 6
  %647 = load i8, i8 addrspace(4)* %646, align 1, !tbaa !11
  %648 = zext i8 %647 to i64
  %649 = shl nuw nsw i64 %648, 48
  %650 = or i64 %645, %649
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 7
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !11
  %653 = zext i8 %652 to i64
  %654 = shl nuw i64 %653, 56
  %655 = or i64 %650, %654
  %656 = add nsw i32 %613, -8
  %657 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 8
  br label %671

658:                                              ; preds = %616, %658
  %659 = phi i32 [ %669, %658 ], [ 0, %616 ]
  %660 = phi i64 [ %668, %658 ], [ 0, %616 ]
  %661 = zext i32 %659 to i64
  %662 = getelementptr inbounds i8, i8 addrspace(4)* %612, i64 %661
  %663 = load i8, i8 addrspace(4)* %662, align 1, !tbaa !11
  %664 = zext i8 %663 to i64
  %665 = shl i32 %659, 3
  %666 = zext i32 %665 to i64
  %667 = shl nuw i64 %664, %666
  %668 = or i64 %667, %660
  %669 = add nuw nsw i32 %659, 1
  %670 = icmp eq i32 %669, %613
  br i1 %670, label %671, label %658

671:                                              ; preds = %658, %618, %616
  %672 = phi i8 addrspace(4)* [ %657, %618 ], [ %612, %616 ], [ %612, %658 ]
  %673 = phi i32 [ %656, %618 ], [ 0, %616 ], [ 0, %658 ]
  %674 = phi i64 [ %655, %618 ], [ 0, %616 ], [ %668, %658 ]
  %675 = icmp ugt i32 %673, 7
  br i1 %675, label %678, label %676

676:                                              ; preds = %671
  %677 = icmp eq i32 %673, 0
  br i1 %677, label %731, label %718

678:                                              ; preds = %671
  %679 = load i8, i8 addrspace(4)* %672, align 1, !tbaa !11
  %680 = zext i8 %679 to i64
  %681 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 1
  %682 = load i8, i8 addrspace(4)* %681, align 1, !tbaa !11
  %683 = zext i8 %682 to i64
  %684 = shl nuw nsw i64 %683, 8
  %685 = or i64 %684, %680
  %686 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 2
  %687 = load i8, i8 addrspace(4)* %686, align 1, !tbaa !11
  %688 = zext i8 %687 to i64
  %689 = shl nuw nsw i64 %688, 16
  %690 = or i64 %685, %689
  %691 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 3
  %692 = load i8, i8 addrspace(4)* %691, align 1, !tbaa !11
  %693 = zext i8 %692 to i64
  %694 = shl nuw nsw i64 %693, 24
  %695 = or i64 %690, %694
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 4
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !11
  %698 = zext i8 %697 to i64
  %699 = shl nuw nsw i64 %698, 32
  %700 = or i64 %695, %699
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 5
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !11
  %703 = zext i8 %702 to i64
  %704 = shl nuw nsw i64 %703, 40
  %705 = or i64 %700, %704
  %706 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 6
  %707 = load i8, i8 addrspace(4)* %706, align 1, !tbaa !11
  %708 = zext i8 %707 to i64
  %709 = shl nuw nsw i64 %708, 48
  %710 = or i64 %705, %709
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 7
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !11
  %713 = zext i8 %712 to i64
  %714 = shl nuw i64 %713, 56
  %715 = or i64 %710, %714
  %716 = add nsw i32 %673, -8
  %717 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 8
  br label %731

718:                                              ; preds = %676, %718
  %719 = phi i32 [ %729, %718 ], [ 0, %676 ]
  %720 = phi i64 [ %728, %718 ], [ 0, %676 ]
  %721 = zext i32 %719 to i64
  %722 = getelementptr inbounds i8, i8 addrspace(4)* %672, i64 %721
  %723 = load i8, i8 addrspace(4)* %722, align 1, !tbaa !11
  %724 = zext i8 %723 to i64
  %725 = shl i32 %719, 3
  %726 = zext i32 %725 to i64
  %727 = shl nuw i64 %724, %726
  %728 = or i64 %727, %720
  %729 = add nuw nsw i32 %719, 1
  %730 = icmp eq i32 %729, %673
  br i1 %730, label %731, label %718

731:                                              ; preds = %718, %678, %676
  %732 = phi i8 addrspace(4)* [ %717, %678 ], [ %672, %676 ], [ %672, %718 ]
  %733 = phi i32 [ %716, %678 ], [ 0, %676 ], [ 0, %718 ]
  %734 = phi i64 [ %715, %678 ], [ 0, %676 ], [ %728, %718 ]
  %735 = icmp ugt i32 %733, 7
  br i1 %735, label %738, label %736

736:                                              ; preds = %731
  %737 = icmp eq i32 %733, 0
  br i1 %737, label %791, label %778

738:                                              ; preds = %731
  %739 = load i8, i8 addrspace(4)* %732, align 1, !tbaa !11
  %740 = zext i8 %739 to i64
  %741 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 1
  %742 = load i8, i8 addrspace(4)* %741, align 1, !tbaa !11
  %743 = zext i8 %742 to i64
  %744 = shl nuw nsw i64 %743, 8
  %745 = or i64 %744, %740
  %746 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 2
  %747 = load i8, i8 addrspace(4)* %746, align 1, !tbaa !11
  %748 = zext i8 %747 to i64
  %749 = shl nuw nsw i64 %748, 16
  %750 = or i64 %745, %749
  %751 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 3
  %752 = load i8, i8 addrspace(4)* %751, align 1, !tbaa !11
  %753 = zext i8 %752 to i64
  %754 = shl nuw nsw i64 %753, 24
  %755 = or i64 %750, %754
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 4
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !11
  %758 = zext i8 %757 to i64
  %759 = shl nuw nsw i64 %758, 32
  %760 = or i64 %755, %759
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 5
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !11
  %763 = zext i8 %762 to i64
  %764 = shl nuw nsw i64 %763, 40
  %765 = or i64 %760, %764
  %766 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 6
  %767 = load i8, i8 addrspace(4)* %766, align 1, !tbaa !11
  %768 = zext i8 %767 to i64
  %769 = shl nuw nsw i64 %768, 48
  %770 = or i64 %765, %769
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 7
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !11
  %773 = zext i8 %772 to i64
  %774 = shl nuw i64 %773, 56
  %775 = or i64 %770, %774
  %776 = add nsw i32 %733, -8
  %777 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 8
  br label %791

778:                                              ; preds = %736, %778
  %779 = phi i32 [ %789, %778 ], [ 0, %736 ]
  %780 = phi i64 [ %788, %778 ], [ 0, %736 ]
  %781 = zext i32 %779 to i64
  %782 = getelementptr inbounds i8, i8 addrspace(4)* %732, i64 %781
  %783 = load i8, i8 addrspace(4)* %782, align 1, !tbaa !11
  %784 = zext i8 %783 to i64
  %785 = shl i32 %779, 3
  %786 = zext i32 %785 to i64
  %787 = shl nuw i64 %784, %786
  %788 = or i64 %787, %780
  %789 = add nuw nsw i32 %779, 1
  %790 = icmp eq i32 %789, %733
  br i1 %790, label %791, label %778

791:                                              ; preds = %778, %738, %736
  %792 = phi i8 addrspace(4)* [ %777, %738 ], [ %732, %736 ], [ %732, %778 ]
  %793 = phi i32 [ %776, %738 ], [ 0, %736 ], [ 0, %778 ]
  %794 = phi i64 [ %775, %738 ], [ 0, %736 ], [ %788, %778 ]
  %795 = icmp ugt i32 %793, 7
  br i1 %795, label %798, label %796

796:                                              ; preds = %791
  %797 = icmp eq i32 %793, 0
  br i1 %797, label %851, label %838

798:                                              ; preds = %791
  %799 = load i8, i8 addrspace(4)* %792, align 1, !tbaa !11
  %800 = zext i8 %799 to i64
  %801 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 1
  %802 = load i8, i8 addrspace(4)* %801, align 1, !tbaa !11
  %803 = zext i8 %802 to i64
  %804 = shl nuw nsw i64 %803, 8
  %805 = or i64 %804, %800
  %806 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 2
  %807 = load i8, i8 addrspace(4)* %806, align 1, !tbaa !11
  %808 = zext i8 %807 to i64
  %809 = shl nuw nsw i64 %808, 16
  %810 = or i64 %805, %809
  %811 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 3
  %812 = load i8, i8 addrspace(4)* %811, align 1, !tbaa !11
  %813 = zext i8 %812 to i64
  %814 = shl nuw nsw i64 %813, 24
  %815 = or i64 %810, %814
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 4
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !11
  %818 = zext i8 %817 to i64
  %819 = shl nuw nsw i64 %818, 32
  %820 = or i64 %815, %819
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 5
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !11
  %823 = zext i8 %822 to i64
  %824 = shl nuw nsw i64 %823, 40
  %825 = or i64 %820, %824
  %826 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 6
  %827 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !11
  %828 = zext i8 %827 to i64
  %829 = shl nuw nsw i64 %828, 48
  %830 = or i64 %825, %829
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 7
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !11
  %833 = zext i8 %832 to i64
  %834 = shl nuw i64 %833, 56
  %835 = or i64 %830, %834
  %836 = add nsw i32 %793, -8
  %837 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 8
  br label %851

838:                                              ; preds = %796, %838
  %839 = phi i32 [ %849, %838 ], [ 0, %796 ]
  %840 = phi i64 [ %848, %838 ], [ 0, %796 ]
  %841 = zext i32 %839 to i64
  %842 = getelementptr inbounds i8, i8 addrspace(4)* %792, i64 %841
  %843 = load i8, i8 addrspace(4)* %842, align 1, !tbaa !11
  %844 = zext i8 %843 to i64
  %845 = shl i32 %839, 3
  %846 = zext i32 %845 to i64
  %847 = shl nuw i64 %844, %846
  %848 = or i64 %847, %840
  %849 = add nuw nsw i32 %839, 1
  %850 = icmp eq i32 %849, %793
  br i1 %850, label %851, label %838

851:                                              ; preds = %838, %798, %796
  %852 = phi i8 addrspace(4)* [ %837, %798 ], [ %792, %796 ], [ %792, %838 ]
  %853 = phi i32 [ %836, %798 ], [ 0, %796 ], [ 0, %838 ]
  %854 = phi i64 [ %835, %798 ], [ 0, %796 ], [ %848, %838 ]
  %855 = icmp ugt i32 %853, 7
  br i1 %855, label %858, label %856

856:                                              ; preds = %851
  %857 = icmp eq i32 %853, 0
  br i1 %857, label %909, label %896

858:                                              ; preds = %851
  %859 = load i8, i8 addrspace(4)* %852, align 1, !tbaa !11
  %860 = zext i8 %859 to i64
  %861 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 1
  %862 = load i8, i8 addrspace(4)* %861, align 1, !tbaa !11
  %863 = zext i8 %862 to i64
  %864 = shl nuw nsw i64 %863, 8
  %865 = or i64 %864, %860
  %866 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 2
  %867 = load i8, i8 addrspace(4)* %866, align 1, !tbaa !11
  %868 = zext i8 %867 to i64
  %869 = shl nuw nsw i64 %868, 16
  %870 = or i64 %865, %869
  %871 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 3
  %872 = load i8, i8 addrspace(4)* %871, align 1, !tbaa !11
  %873 = zext i8 %872 to i64
  %874 = shl nuw nsw i64 %873, 24
  %875 = or i64 %870, %874
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 4
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !11
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 32
  %880 = or i64 %875, %879
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 5
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !11
  %883 = zext i8 %882 to i64
  %884 = shl nuw nsw i64 %883, 40
  %885 = or i64 %880, %884
  %886 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 6
  %887 = load i8, i8 addrspace(4)* %886, align 1, !tbaa !11
  %888 = zext i8 %887 to i64
  %889 = shl nuw nsw i64 %888, 48
  %890 = or i64 %885, %889
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 7
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !11
  %893 = zext i8 %892 to i64
  %894 = shl nuw i64 %893, 56
  %895 = or i64 %890, %894
  br label %909

896:                                              ; preds = %856, %896
  %897 = phi i32 [ %907, %896 ], [ 0, %856 ]
  %898 = phi i64 [ %906, %896 ], [ 0, %856 ]
  %899 = zext i32 %897 to i64
  %900 = getelementptr inbounds i8, i8 addrspace(4)* %852, i64 %899
  %901 = load i8, i8 addrspace(4)* %900, align 1, !tbaa !11
  %902 = zext i8 %901 to i64
  %903 = shl i32 %897, 3
  %904 = zext i32 %903 to i64
  %905 = shl nuw i64 %902, %904
  %906 = or i64 %905, %898
  %907 = add nuw nsw i32 %897, 1
  %908 = icmp eq i32 %907, %853
  br i1 %908, label %909, label %896

909:                                              ; preds = %896, %858, %856
  %910 = phi i64 [ %895, %858 ], [ 0, %856 ], [ %906, %896 ]
  %911 = shl nuw nsw i64 %492, 2
  %912 = add nuw nsw i64 %911, 28
  %913 = and i64 %912, 480
  %914 = and i64 %494, -225
  %915 = or i64 %914, %913
  %916 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %915, i64 noundef %554, i64 noundef %614, i64 noundef %674, i64 noundef %734, i64 noundef %794, i64 noundef %854, i64 noundef %910) #11
  %917 = sub i64 %484, %492
  %918 = getelementptr inbounds i8, i8 addrspace(4)* %485, i64 %492
  %919 = icmp eq i64 %917, 0
  br i1 %919, label %920, label %483

920:                                              ; preds = %909, %475
  %921 = phi <2 x i64> [ %478, %475 ], [ %916, %909 ]
  %922 = extractelement <2 x i64> %921, i64 0
  %923 = zext i16 %8 to i64
  %924 = and i64 %922, -227
  %925 = or i64 %924, 34
  %926 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %925, i64 noundef %923, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %927 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %928 = extractelement <2 x i64> %927, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %929, label %933

929:                                              ; preds = %920
  %930 = and i64 %928, -225
  %931 = or i64 %930, 32
  %932 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %931, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1374

933:                                              ; preds = %920
  %934 = and i64 %928, 2
  %935 = and i64 %928, -3
  %936 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %935, i64 0
  br label %937

937:                                              ; preds = %1363, %933
  %938 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.2 to [16 x i8]*) to i64)), i64 1))), %933 ], [ %1371, %1363 ]
  %939 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %933 ], [ %1372, %1363 ]
  %940 = phi <2 x i64> [ %936, %933 ], [ %1370, %1363 ]
  %941 = icmp ugt i64 %938, 56
  %942 = extractelement <2 x i64> %940, i64 0
  %943 = or i64 %942, %934
  %944 = insertelement <2 x i64> poison, i64 %943, i64 0
  %945 = select i1 %941, <2 x i64> %940, <2 x i64> %944
  %946 = tail call i64 @llvm.umin.i64(i64 %938, i64 56)
  %947 = trunc i64 %946 to i32
  %948 = extractelement <2 x i64> %945, i64 0
  %949 = icmp ugt i32 %947, 7
  br i1 %949, label %952, label %950

950:                                              ; preds = %937
  %951 = icmp eq i32 %947, 0
  br i1 %951, label %1005, label %992

952:                                              ; preds = %937
  %953 = load i8, i8 addrspace(4)* %939, align 1, !tbaa !11
  %954 = zext i8 %953 to i64
  %955 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 1
  %956 = load i8, i8 addrspace(4)* %955, align 1, !tbaa !11
  %957 = zext i8 %956 to i64
  %958 = shl nuw nsw i64 %957, 8
  %959 = or i64 %958, %954
  %960 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 2
  %961 = load i8, i8 addrspace(4)* %960, align 1, !tbaa !11
  %962 = zext i8 %961 to i64
  %963 = shl nuw nsw i64 %962, 16
  %964 = or i64 %959, %963
  %965 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 3
  %966 = load i8, i8 addrspace(4)* %965, align 1, !tbaa !11
  %967 = zext i8 %966 to i64
  %968 = shl nuw nsw i64 %967, 24
  %969 = or i64 %964, %968
  %970 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 4
  %971 = load i8, i8 addrspace(4)* %970, align 1, !tbaa !11
  %972 = zext i8 %971 to i64
  %973 = shl nuw nsw i64 %972, 32
  %974 = or i64 %969, %973
  %975 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 5
  %976 = load i8, i8 addrspace(4)* %975, align 1, !tbaa !11
  %977 = zext i8 %976 to i64
  %978 = shl nuw nsw i64 %977, 40
  %979 = or i64 %974, %978
  %980 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 6
  %981 = load i8, i8 addrspace(4)* %980, align 1, !tbaa !11
  %982 = zext i8 %981 to i64
  %983 = shl nuw nsw i64 %982, 48
  %984 = or i64 %979, %983
  %985 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 7
  %986 = load i8, i8 addrspace(4)* %985, align 1, !tbaa !11
  %987 = zext i8 %986 to i64
  %988 = shl nuw i64 %987, 56
  %989 = or i64 %984, %988
  %990 = add nsw i32 %947, -8
  %991 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 8
  br label %1005

992:                                              ; preds = %950, %992
  %993 = phi i32 [ %1003, %992 ], [ 0, %950 ]
  %994 = phi i64 [ %1002, %992 ], [ 0, %950 ]
  %995 = zext i32 %993 to i64
  %996 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 %995
  %997 = load i8, i8 addrspace(4)* %996, align 1, !tbaa !11
  %998 = zext i8 %997 to i64
  %999 = shl i32 %993, 3
  %1000 = zext i32 %999 to i64
  %1001 = shl nuw i64 %998, %1000
  %1002 = or i64 %1001, %994
  %1003 = add nuw nsw i32 %993, 1
  %1004 = icmp eq i32 %1003, %947
  br i1 %1004, label %1005, label %992, !llvm.loop !12

1005:                                             ; preds = %992, %952, %950
  %1006 = phi i8 addrspace(4)* [ %991, %952 ], [ %939, %950 ], [ %939, %992 ]
  %1007 = phi i32 [ %990, %952 ], [ 0, %950 ], [ 0, %992 ]
  %1008 = phi i64 [ %989, %952 ], [ 0, %950 ], [ %1002, %992 ]
  %1009 = icmp ugt i32 %1007, 7
  br i1 %1009, label %1012, label %1010

1010:                                             ; preds = %1005
  %1011 = icmp eq i32 %1007, 0
  br i1 %1011, label %1065, label %1052

1012:                                             ; preds = %1005
  %1013 = load i8, i8 addrspace(4)* %1006, align 1, !tbaa !11
  %1014 = zext i8 %1013 to i64
  %1015 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 1
  %1016 = load i8, i8 addrspace(4)* %1015, align 1, !tbaa !11
  %1017 = zext i8 %1016 to i64
  %1018 = shl nuw nsw i64 %1017, 8
  %1019 = or i64 %1018, %1014
  %1020 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 2
  %1021 = load i8, i8 addrspace(4)* %1020, align 1, !tbaa !11
  %1022 = zext i8 %1021 to i64
  %1023 = shl nuw nsw i64 %1022, 16
  %1024 = or i64 %1019, %1023
  %1025 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 3
  %1026 = load i8, i8 addrspace(4)* %1025, align 1, !tbaa !11
  %1027 = zext i8 %1026 to i64
  %1028 = shl nuw nsw i64 %1027, 24
  %1029 = or i64 %1024, %1028
  %1030 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 4
  %1031 = load i8, i8 addrspace(4)* %1030, align 1, !tbaa !11
  %1032 = zext i8 %1031 to i64
  %1033 = shl nuw nsw i64 %1032, 32
  %1034 = or i64 %1029, %1033
  %1035 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 5
  %1036 = load i8, i8 addrspace(4)* %1035, align 1, !tbaa !11
  %1037 = zext i8 %1036 to i64
  %1038 = shl nuw nsw i64 %1037, 40
  %1039 = or i64 %1034, %1038
  %1040 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 6
  %1041 = load i8, i8 addrspace(4)* %1040, align 1, !tbaa !11
  %1042 = zext i8 %1041 to i64
  %1043 = shl nuw nsw i64 %1042, 48
  %1044 = or i64 %1039, %1043
  %1045 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 7
  %1046 = load i8, i8 addrspace(4)* %1045, align 1, !tbaa !11
  %1047 = zext i8 %1046 to i64
  %1048 = shl nuw i64 %1047, 56
  %1049 = or i64 %1044, %1048
  %1050 = add nsw i32 %1007, -8
  %1051 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 8
  br label %1065

1052:                                             ; preds = %1010, %1052
  %1053 = phi i32 [ %1063, %1052 ], [ 0, %1010 ]
  %1054 = phi i64 [ %1062, %1052 ], [ 0, %1010 ]
  %1055 = zext i32 %1053 to i64
  %1056 = getelementptr inbounds i8, i8 addrspace(4)* %1006, i64 %1055
  %1057 = load i8, i8 addrspace(4)* %1056, align 1, !tbaa !11
  %1058 = zext i8 %1057 to i64
  %1059 = shl i32 %1053, 3
  %1060 = zext i32 %1059 to i64
  %1061 = shl nuw i64 %1058, %1060
  %1062 = or i64 %1061, %1054
  %1063 = add nuw nsw i32 %1053, 1
  %1064 = icmp eq i32 %1063, %1007
  br i1 %1064, label %1065, label %1052

1065:                                             ; preds = %1052, %1012, %1010
  %1066 = phi i8 addrspace(4)* [ %1051, %1012 ], [ %1006, %1010 ], [ %1006, %1052 ]
  %1067 = phi i32 [ %1050, %1012 ], [ 0, %1010 ], [ 0, %1052 ]
  %1068 = phi i64 [ %1049, %1012 ], [ 0, %1010 ], [ %1062, %1052 ]
  %1069 = icmp ugt i32 %1067, 7
  br i1 %1069, label %1072, label %1070

1070:                                             ; preds = %1065
  %1071 = icmp eq i32 %1067, 0
  br i1 %1071, label %1125, label %1112

1072:                                             ; preds = %1065
  %1073 = load i8, i8 addrspace(4)* %1066, align 1, !tbaa !11
  %1074 = zext i8 %1073 to i64
  %1075 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 1
  %1076 = load i8, i8 addrspace(4)* %1075, align 1, !tbaa !11
  %1077 = zext i8 %1076 to i64
  %1078 = shl nuw nsw i64 %1077, 8
  %1079 = or i64 %1078, %1074
  %1080 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 2
  %1081 = load i8, i8 addrspace(4)* %1080, align 1, !tbaa !11
  %1082 = zext i8 %1081 to i64
  %1083 = shl nuw nsw i64 %1082, 16
  %1084 = or i64 %1079, %1083
  %1085 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 3
  %1086 = load i8, i8 addrspace(4)* %1085, align 1, !tbaa !11
  %1087 = zext i8 %1086 to i64
  %1088 = shl nuw nsw i64 %1087, 24
  %1089 = or i64 %1084, %1088
  %1090 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 4
  %1091 = load i8, i8 addrspace(4)* %1090, align 1, !tbaa !11
  %1092 = zext i8 %1091 to i64
  %1093 = shl nuw nsw i64 %1092, 32
  %1094 = or i64 %1089, %1093
  %1095 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 5
  %1096 = load i8, i8 addrspace(4)* %1095, align 1, !tbaa !11
  %1097 = zext i8 %1096 to i64
  %1098 = shl nuw nsw i64 %1097, 40
  %1099 = or i64 %1094, %1098
  %1100 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 6
  %1101 = load i8, i8 addrspace(4)* %1100, align 1, !tbaa !11
  %1102 = zext i8 %1101 to i64
  %1103 = shl nuw nsw i64 %1102, 48
  %1104 = or i64 %1099, %1103
  %1105 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 7
  %1106 = load i8, i8 addrspace(4)* %1105, align 1, !tbaa !11
  %1107 = zext i8 %1106 to i64
  %1108 = shl nuw i64 %1107, 56
  %1109 = or i64 %1104, %1108
  %1110 = add nsw i32 %1067, -8
  %1111 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 8
  br label %1125

1112:                                             ; preds = %1070, %1112
  %1113 = phi i32 [ %1123, %1112 ], [ 0, %1070 ]
  %1114 = phi i64 [ %1122, %1112 ], [ 0, %1070 ]
  %1115 = zext i32 %1113 to i64
  %1116 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 %1115
  %1117 = load i8, i8 addrspace(4)* %1116, align 1, !tbaa !11
  %1118 = zext i8 %1117 to i64
  %1119 = shl i32 %1113, 3
  %1120 = zext i32 %1119 to i64
  %1121 = shl nuw i64 %1118, %1120
  %1122 = or i64 %1121, %1114
  %1123 = add nuw nsw i32 %1113, 1
  %1124 = icmp eq i32 %1123, %1067
  br i1 %1124, label %1125, label %1112

1125:                                             ; preds = %1112, %1072, %1070
  %1126 = phi i8 addrspace(4)* [ %1111, %1072 ], [ %1066, %1070 ], [ %1066, %1112 ]
  %1127 = phi i32 [ %1110, %1072 ], [ 0, %1070 ], [ 0, %1112 ]
  %1128 = phi i64 [ %1109, %1072 ], [ 0, %1070 ], [ %1122, %1112 ]
  %1129 = icmp ugt i32 %1127, 7
  br i1 %1129, label %1132, label %1130

1130:                                             ; preds = %1125
  %1131 = icmp eq i32 %1127, 0
  br i1 %1131, label %1185, label %1172

1132:                                             ; preds = %1125
  %1133 = load i8, i8 addrspace(4)* %1126, align 1, !tbaa !11
  %1134 = zext i8 %1133 to i64
  %1135 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 1
  %1136 = load i8, i8 addrspace(4)* %1135, align 1, !tbaa !11
  %1137 = zext i8 %1136 to i64
  %1138 = shl nuw nsw i64 %1137, 8
  %1139 = or i64 %1138, %1134
  %1140 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 2
  %1141 = load i8, i8 addrspace(4)* %1140, align 1, !tbaa !11
  %1142 = zext i8 %1141 to i64
  %1143 = shl nuw nsw i64 %1142, 16
  %1144 = or i64 %1139, %1143
  %1145 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 3
  %1146 = load i8, i8 addrspace(4)* %1145, align 1, !tbaa !11
  %1147 = zext i8 %1146 to i64
  %1148 = shl nuw nsw i64 %1147, 24
  %1149 = or i64 %1144, %1148
  %1150 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 4
  %1151 = load i8, i8 addrspace(4)* %1150, align 1, !tbaa !11
  %1152 = zext i8 %1151 to i64
  %1153 = shl nuw nsw i64 %1152, 32
  %1154 = or i64 %1149, %1153
  %1155 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 5
  %1156 = load i8, i8 addrspace(4)* %1155, align 1, !tbaa !11
  %1157 = zext i8 %1156 to i64
  %1158 = shl nuw nsw i64 %1157, 40
  %1159 = or i64 %1154, %1158
  %1160 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 6
  %1161 = load i8, i8 addrspace(4)* %1160, align 1, !tbaa !11
  %1162 = zext i8 %1161 to i64
  %1163 = shl nuw nsw i64 %1162, 48
  %1164 = or i64 %1159, %1163
  %1165 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 7
  %1166 = load i8, i8 addrspace(4)* %1165, align 1, !tbaa !11
  %1167 = zext i8 %1166 to i64
  %1168 = shl nuw i64 %1167, 56
  %1169 = or i64 %1164, %1168
  %1170 = add nsw i32 %1127, -8
  %1171 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 8
  br label %1185

1172:                                             ; preds = %1130, %1172
  %1173 = phi i32 [ %1183, %1172 ], [ 0, %1130 ]
  %1174 = phi i64 [ %1182, %1172 ], [ 0, %1130 ]
  %1175 = zext i32 %1173 to i64
  %1176 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 %1175
  %1177 = load i8, i8 addrspace(4)* %1176, align 1, !tbaa !11
  %1178 = zext i8 %1177 to i64
  %1179 = shl i32 %1173, 3
  %1180 = zext i32 %1179 to i64
  %1181 = shl nuw i64 %1178, %1180
  %1182 = or i64 %1181, %1174
  %1183 = add nuw nsw i32 %1173, 1
  %1184 = icmp eq i32 %1183, %1127
  br i1 %1184, label %1185, label %1172

1185:                                             ; preds = %1172, %1132, %1130
  %1186 = phi i8 addrspace(4)* [ %1171, %1132 ], [ %1126, %1130 ], [ %1126, %1172 ]
  %1187 = phi i32 [ %1170, %1132 ], [ 0, %1130 ], [ 0, %1172 ]
  %1188 = phi i64 [ %1169, %1132 ], [ 0, %1130 ], [ %1182, %1172 ]
  %1189 = icmp ugt i32 %1187, 7
  br i1 %1189, label %1192, label %1190

1190:                                             ; preds = %1185
  %1191 = icmp eq i32 %1187, 0
  br i1 %1191, label %1245, label %1232

1192:                                             ; preds = %1185
  %1193 = load i8, i8 addrspace(4)* %1186, align 1, !tbaa !11
  %1194 = zext i8 %1193 to i64
  %1195 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 1
  %1196 = load i8, i8 addrspace(4)* %1195, align 1, !tbaa !11
  %1197 = zext i8 %1196 to i64
  %1198 = shl nuw nsw i64 %1197, 8
  %1199 = or i64 %1198, %1194
  %1200 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 2
  %1201 = load i8, i8 addrspace(4)* %1200, align 1, !tbaa !11
  %1202 = zext i8 %1201 to i64
  %1203 = shl nuw nsw i64 %1202, 16
  %1204 = or i64 %1199, %1203
  %1205 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 3
  %1206 = load i8, i8 addrspace(4)* %1205, align 1, !tbaa !11
  %1207 = zext i8 %1206 to i64
  %1208 = shl nuw nsw i64 %1207, 24
  %1209 = or i64 %1204, %1208
  %1210 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 4
  %1211 = load i8, i8 addrspace(4)* %1210, align 1, !tbaa !11
  %1212 = zext i8 %1211 to i64
  %1213 = shl nuw nsw i64 %1212, 32
  %1214 = or i64 %1209, %1213
  %1215 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 5
  %1216 = load i8, i8 addrspace(4)* %1215, align 1, !tbaa !11
  %1217 = zext i8 %1216 to i64
  %1218 = shl nuw nsw i64 %1217, 40
  %1219 = or i64 %1214, %1218
  %1220 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 6
  %1221 = load i8, i8 addrspace(4)* %1220, align 1, !tbaa !11
  %1222 = zext i8 %1221 to i64
  %1223 = shl nuw nsw i64 %1222, 48
  %1224 = or i64 %1219, %1223
  %1225 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 7
  %1226 = load i8, i8 addrspace(4)* %1225, align 1, !tbaa !11
  %1227 = zext i8 %1226 to i64
  %1228 = shl nuw i64 %1227, 56
  %1229 = or i64 %1224, %1228
  %1230 = add nsw i32 %1187, -8
  %1231 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 8
  br label %1245

1232:                                             ; preds = %1190, %1232
  %1233 = phi i32 [ %1243, %1232 ], [ 0, %1190 ]
  %1234 = phi i64 [ %1242, %1232 ], [ 0, %1190 ]
  %1235 = zext i32 %1233 to i64
  %1236 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 %1235
  %1237 = load i8, i8 addrspace(4)* %1236, align 1, !tbaa !11
  %1238 = zext i8 %1237 to i64
  %1239 = shl i32 %1233, 3
  %1240 = zext i32 %1239 to i64
  %1241 = shl nuw i64 %1238, %1240
  %1242 = or i64 %1241, %1234
  %1243 = add nuw nsw i32 %1233, 1
  %1244 = icmp eq i32 %1243, %1187
  br i1 %1244, label %1245, label %1232

1245:                                             ; preds = %1232, %1192, %1190
  %1246 = phi i8 addrspace(4)* [ %1231, %1192 ], [ %1186, %1190 ], [ %1186, %1232 ]
  %1247 = phi i32 [ %1230, %1192 ], [ 0, %1190 ], [ 0, %1232 ]
  %1248 = phi i64 [ %1229, %1192 ], [ 0, %1190 ], [ %1242, %1232 ]
  %1249 = icmp ugt i32 %1247, 7
  br i1 %1249, label %1252, label %1250

1250:                                             ; preds = %1245
  %1251 = icmp eq i32 %1247, 0
  br i1 %1251, label %1305, label %1292

1252:                                             ; preds = %1245
  %1253 = load i8, i8 addrspace(4)* %1246, align 1, !tbaa !11
  %1254 = zext i8 %1253 to i64
  %1255 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 1
  %1256 = load i8, i8 addrspace(4)* %1255, align 1, !tbaa !11
  %1257 = zext i8 %1256 to i64
  %1258 = shl nuw nsw i64 %1257, 8
  %1259 = or i64 %1258, %1254
  %1260 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 2
  %1261 = load i8, i8 addrspace(4)* %1260, align 1, !tbaa !11
  %1262 = zext i8 %1261 to i64
  %1263 = shl nuw nsw i64 %1262, 16
  %1264 = or i64 %1259, %1263
  %1265 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 3
  %1266 = load i8, i8 addrspace(4)* %1265, align 1, !tbaa !11
  %1267 = zext i8 %1266 to i64
  %1268 = shl nuw nsw i64 %1267, 24
  %1269 = or i64 %1264, %1268
  %1270 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 4
  %1271 = load i8, i8 addrspace(4)* %1270, align 1, !tbaa !11
  %1272 = zext i8 %1271 to i64
  %1273 = shl nuw nsw i64 %1272, 32
  %1274 = or i64 %1269, %1273
  %1275 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 5
  %1276 = load i8, i8 addrspace(4)* %1275, align 1, !tbaa !11
  %1277 = zext i8 %1276 to i64
  %1278 = shl nuw nsw i64 %1277, 40
  %1279 = or i64 %1274, %1278
  %1280 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 6
  %1281 = load i8, i8 addrspace(4)* %1280, align 1, !tbaa !11
  %1282 = zext i8 %1281 to i64
  %1283 = shl nuw nsw i64 %1282, 48
  %1284 = or i64 %1279, %1283
  %1285 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 7
  %1286 = load i8, i8 addrspace(4)* %1285, align 1, !tbaa !11
  %1287 = zext i8 %1286 to i64
  %1288 = shl nuw i64 %1287, 56
  %1289 = or i64 %1284, %1288
  %1290 = add nsw i32 %1247, -8
  %1291 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 8
  br label %1305

1292:                                             ; preds = %1250, %1292
  %1293 = phi i32 [ %1303, %1292 ], [ 0, %1250 ]
  %1294 = phi i64 [ %1302, %1292 ], [ 0, %1250 ]
  %1295 = zext i32 %1293 to i64
  %1296 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 %1295
  %1297 = load i8, i8 addrspace(4)* %1296, align 1, !tbaa !11
  %1298 = zext i8 %1297 to i64
  %1299 = shl i32 %1293, 3
  %1300 = zext i32 %1299 to i64
  %1301 = shl nuw i64 %1298, %1300
  %1302 = or i64 %1301, %1294
  %1303 = add nuw nsw i32 %1293, 1
  %1304 = icmp eq i32 %1303, %1247
  br i1 %1304, label %1305, label %1292

1305:                                             ; preds = %1292, %1252, %1250
  %1306 = phi i8 addrspace(4)* [ %1291, %1252 ], [ %1246, %1250 ], [ %1246, %1292 ]
  %1307 = phi i32 [ %1290, %1252 ], [ 0, %1250 ], [ 0, %1292 ]
  %1308 = phi i64 [ %1289, %1252 ], [ 0, %1250 ], [ %1302, %1292 ]
  %1309 = icmp ugt i32 %1307, 7
  br i1 %1309, label %1312, label %1310

1310:                                             ; preds = %1305
  %1311 = icmp eq i32 %1307, 0
  br i1 %1311, label %1363, label %1350

1312:                                             ; preds = %1305
  %1313 = load i8, i8 addrspace(4)* %1306, align 1, !tbaa !11
  %1314 = zext i8 %1313 to i64
  %1315 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 1
  %1316 = load i8, i8 addrspace(4)* %1315, align 1, !tbaa !11
  %1317 = zext i8 %1316 to i64
  %1318 = shl nuw nsw i64 %1317, 8
  %1319 = or i64 %1318, %1314
  %1320 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 2
  %1321 = load i8, i8 addrspace(4)* %1320, align 1, !tbaa !11
  %1322 = zext i8 %1321 to i64
  %1323 = shl nuw nsw i64 %1322, 16
  %1324 = or i64 %1319, %1323
  %1325 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 3
  %1326 = load i8, i8 addrspace(4)* %1325, align 1, !tbaa !11
  %1327 = zext i8 %1326 to i64
  %1328 = shl nuw nsw i64 %1327, 24
  %1329 = or i64 %1324, %1328
  %1330 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 4
  %1331 = load i8, i8 addrspace(4)* %1330, align 1, !tbaa !11
  %1332 = zext i8 %1331 to i64
  %1333 = shl nuw nsw i64 %1332, 32
  %1334 = or i64 %1329, %1333
  %1335 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 5
  %1336 = load i8, i8 addrspace(4)* %1335, align 1, !tbaa !11
  %1337 = zext i8 %1336 to i64
  %1338 = shl nuw nsw i64 %1337, 40
  %1339 = or i64 %1334, %1338
  %1340 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 6
  %1341 = load i8, i8 addrspace(4)* %1340, align 1, !tbaa !11
  %1342 = zext i8 %1341 to i64
  %1343 = shl nuw nsw i64 %1342, 48
  %1344 = or i64 %1339, %1343
  %1345 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 7
  %1346 = load i8, i8 addrspace(4)* %1345, align 1, !tbaa !11
  %1347 = zext i8 %1346 to i64
  %1348 = shl nuw i64 %1347, 56
  %1349 = or i64 %1344, %1348
  br label %1363

1350:                                             ; preds = %1310, %1350
  %1351 = phi i32 [ %1361, %1350 ], [ 0, %1310 ]
  %1352 = phi i64 [ %1360, %1350 ], [ 0, %1310 ]
  %1353 = zext i32 %1351 to i64
  %1354 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 %1353
  %1355 = load i8, i8 addrspace(4)* %1354, align 1, !tbaa !11
  %1356 = zext i8 %1355 to i64
  %1357 = shl i32 %1351, 3
  %1358 = zext i32 %1357 to i64
  %1359 = shl nuw i64 %1356, %1358
  %1360 = or i64 %1359, %1352
  %1361 = add nuw nsw i32 %1351, 1
  %1362 = icmp eq i32 %1361, %1307
  br i1 %1362, label %1363, label %1350

1363:                                             ; preds = %1350, %1312, %1310
  %1364 = phi i64 [ %1349, %1312 ], [ 0, %1310 ], [ %1360, %1350 ]
  %1365 = shl nuw nsw i64 %946, 2
  %1366 = add nuw nsw i64 %1365, 28
  %1367 = and i64 %1366, 480
  %1368 = and i64 %948, -225
  %1369 = or i64 %1368, %1367
  %1370 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %1369, i64 noundef %1008, i64 noundef %1068, i64 noundef %1128, i64 noundef %1188, i64 noundef %1248, i64 noundef %1308, i64 noundef %1364) #11
  %1371 = sub i64 %938, %946
  %1372 = getelementptr inbounds i8, i8 addrspace(4)* %939, i64 %946
  %1373 = icmp eq i64 %1371, 0
  br i1 %1373, label %1374, label %937

1374:                                             ; preds = %1363, %929
  %1375 = phi <2 x i64> [ %932, %929 ], [ %1370, %1363 ]
  %1376 = extractelement <2 x i64> %1375, i64 0
  %1377 = zext i32 %4 to i64
  %1378 = and i64 %1376, -227
  %1379 = or i64 %1378, 34
  %1380 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %1379, i64 noundef %1377, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1381 = sext i32 %12 to i64
  %1382 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1381
  %1383 = load i32, i32 addrspace(1)* %1382, align 4, !tbaa !14
  %1384 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %1381
  %1385 = load i32, i32 addrspace(1)* %1384, align 4, !tbaa !14
  %1386 = mul nsw i32 %1385, %1383
  %1387 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 %4
  store i32 %1386, i32 addrspace(3)* %1387, align 4, !tbaa !14
  %1388 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1389 = extractelement <2 x i64> %1388, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1390, label %1394

1390:                                             ; preds = %1374
  %1391 = and i64 %1389, -225
  %1392 = or i64 %1391, 32
  %1393 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %1392, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1835

1394:                                             ; preds = %1374
  %1395 = and i64 %1389, 2
  %1396 = and i64 %1389, -3
  %1397 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1396, i64 0
  br label %1398

1398:                                             ; preds = %1824, %1394
  %1399 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.3, i64 0, i64 8) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([9 x i8]* addrspacecast ([9 x i8] addrspace(4)* @.str.3 to [9 x i8]*) to i64)), i64 1))), %1394 ], [ %1832, %1824 ]
  %1400 = phi i8 addrspace(4)* [ getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1394 ], [ %1833, %1824 ]
  %1401 = phi <2 x i64> [ %1397, %1394 ], [ %1831, %1824 ]
  %1402 = icmp ugt i64 %1399, 56
  %1403 = extractelement <2 x i64> %1401, i64 0
  %1404 = or i64 %1403, %1395
  %1405 = insertelement <2 x i64> poison, i64 %1404, i64 0
  %1406 = select i1 %1402, <2 x i64> %1401, <2 x i64> %1405
  %1407 = tail call i64 @llvm.umin.i64(i64 %1399, i64 56)
  %1408 = trunc i64 %1407 to i32
  %1409 = extractelement <2 x i64> %1406, i64 0
  %1410 = icmp ugt i32 %1408, 7
  br i1 %1410, label %1413, label %1411

1411:                                             ; preds = %1398
  %1412 = icmp eq i32 %1408, 0
  br i1 %1412, label %1466, label %1453

1413:                                             ; preds = %1398
  %1414 = load i8, i8 addrspace(4)* %1400, align 1, !tbaa !11
  %1415 = zext i8 %1414 to i64
  %1416 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 1
  %1417 = load i8, i8 addrspace(4)* %1416, align 1, !tbaa !11
  %1418 = zext i8 %1417 to i64
  %1419 = shl nuw nsw i64 %1418, 8
  %1420 = or i64 %1419, %1415
  %1421 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 2
  %1422 = load i8, i8 addrspace(4)* %1421, align 1, !tbaa !11
  %1423 = zext i8 %1422 to i64
  %1424 = shl nuw nsw i64 %1423, 16
  %1425 = or i64 %1420, %1424
  %1426 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 3
  %1427 = load i8, i8 addrspace(4)* %1426, align 1, !tbaa !11
  %1428 = zext i8 %1427 to i64
  %1429 = shl nuw nsw i64 %1428, 24
  %1430 = or i64 %1425, %1429
  %1431 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 4
  %1432 = load i8, i8 addrspace(4)* %1431, align 1, !tbaa !11
  %1433 = zext i8 %1432 to i64
  %1434 = shl nuw nsw i64 %1433, 32
  %1435 = or i64 %1430, %1434
  %1436 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 5
  %1437 = load i8, i8 addrspace(4)* %1436, align 1, !tbaa !11
  %1438 = zext i8 %1437 to i64
  %1439 = shl nuw nsw i64 %1438, 40
  %1440 = or i64 %1435, %1439
  %1441 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 6
  %1442 = load i8, i8 addrspace(4)* %1441, align 1, !tbaa !11
  %1443 = zext i8 %1442 to i64
  %1444 = shl nuw nsw i64 %1443, 48
  %1445 = or i64 %1440, %1444
  %1446 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 7
  %1447 = load i8, i8 addrspace(4)* %1446, align 1, !tbaa !11
  %1448 = zext i8 %1447 to i64
  %1449 = shl nuw i64 %1448, 56
  %1450 = or i64 %1445, %1449
  %1451 = add nsw i32 %1408, -8
  %1452 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 8
  br label %1466

1453:                                             ; preds = %1411, %1453
  %1454 = phi i32 [ %1464, %1453 ], [ 0, %1411 ]
  %1455 = phi i64 [ %1463, %1453 ], [ 0, %1411 ]
  %1456 = zext i32 %1454 to i64
  %1457 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 %1456
  %1458 = load i8, i8 addrspace(4)* %1457, align 1, !tbaa !11
  %1459 = zext i8 %1458 to i64
  %1460 = shl i32 %1454, 3
  %1461 = zext i32 %1460 to i64
  %1462 = shl nuw i64 %1459, %1461
  %1463 = or i64 %1462, %1455
  %1464 = add nuw nsw i32 %1454, 1
  %1465 = icmp eq i32 %1464, %1408
  br i1 %1465, label %1466, label %1453, !llvm.loop !12

1466:                                             ; preds = %1453, %1413, %1411
  %1467 = phi i8 addrspace(4)* [ %1452, %1413 ], [ %1400, %1411 ], [ %1400, %1453 ]
  %1468 = phi i32 [ %1451, %1413 ], [ 0, %1411 ], [ 0, %1453 ]
  %1469 = phi i64 [ %1450, %1413 ], [ 0, %1411 ], [ %1463, %1453 ]
  %1470 = icmp ugt i32 %1468, 7
  br i1 %1470, label %1473, label %1471

1471:                                             ; preds = %1466
  %1472 = icmp eq i32 %1468, 0
  br i1 %1472, label %1526, label %1513

1473:                                             ; preds = %1466
  %1474 = load i8, i8 addrspace(4)* %1467, align 1, !tbaa !11
  %1475 = zext i8 %1474 to i64
  %1476 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 1
  %1477 = load i8, i8 addrspace(4)* %1476, align 1, !tbaa !11
  %1478 = zext i8 %1477 to i64
  %1479 = shl nuw nsw i64 %1478, 8
  %1480 = or i64 %1479, %1475
  %1481 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 2
  %1482 = load i8, i8 addrspace(4)* %1481, align 1, !tbaa !11
  %1483 = zext i8 %1482 to i64
  %1484 = shl nuw nsw i64 %1483, 16
  %1485 = or i64 %1480, %1484
  %1486 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 3
  %1487 = load i8, i8 addrspace(4)* %1486, align 1, !tbaa !11
  %1488 = zext i8 %1487 to i64
  %1489 = shl nuw nsw i64 %1488, 24
  %1490 = or i64 %1485, %1489
  %1491 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 4
  %1492 = load i8, i8 addrspace(4)* %1491, align 1, !tbaa !11
  %1493 = zext i8 %1492 to i64
  %1494 = shl nuw nsw i64 %1493, 32
  %1495 = or i64 %1490, %1494
  %1496 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 5
  %1497 = load i8, i8 addrspace(4)* %1496, align 1, !tbaa !11
  %1498 = zext i8 %1497 to i64
  %1499 = shl nuw nsw i64 %1498, 40
  %1500 = or i64 %1495, %1499
  %1501 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 6
  %1502 = load i8, i8 addrspace(4)* %1501, align 1, !tbaa !11
  %1503 = zext i8 %1502 to i64
  %1504 = shl nuw nsw i64 %1503, 48
  %1505 = or i64 %1500, %1504
  %1506 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 7
  %1507 = load i8, i8 addrspace(4)* %1506, align 1, !tbaa !11
  %1508 = zext i8 %1507 to i64
  %1509 = shl nuw i64 %1508, 56
  %1510 = or i64 %1505, %1509
  %1511 = add nsw i32 %1468, -8
  %1512 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 8
  br label %1526

1513:                                             ; preds = %1471, %1513
  %1514 = phi i32 [ %1524, %1513 ], [ 0, %1471 ]
  %1515 = phi i64 [ %1523, %1513 ], [ 0, %1471 ]
  %1516 = zext i32 %1514 to i64
  %1517 = getelementptr inbounds i8, i8 addrspace(4)* %1467, i64 %1516
  %1518 = load i8, i8 addrspace(4)* %1517, align 1, !tbaa !11
  %1519 = zext i8 %1518 to i64
  %1520 = shl i32 %1514, 3
  %1521 = zext i32 %1520 to i64
  %1522 = shl nuw i64 %1519, %1521
  %1523 = or i64 %1522, %1515
  %1524 = add nuw nsw i32 %1514, 1
  %1525 = icmp eq i32 %1524, %1468
  br i1 %1525, label %1526, label %1513

1526:                                             ; preds = %1513, %1473, %1471
  %1527 = phi i8 addrspace(4)* [ %1512, %1473 ], [ %1467, %1471 ], [ %1467, %1513 ]
  %1528 = phi i32 [ %1511, %1473 ], [ 0, %1471 ], [ 0, %1513 ]
  %1529 = phi i64 [ %1510, %1473 ], [ 0, %1471 ], [ %1523, %1513 ]
  %1530 = icmp ugt i32 %1528, 7
  br i1 %1530, label %1533, label %1531

1531:                                             ; preds = %1526
  %1532 = icmp eq i32 %1528, 0
  br i1 %1532, label %1586, label %1573

1533:                                             ; preds = %1526
  %1534 = load i8, i8 addrspace(4)* %1527, align 1, !tbaa !11
  %1535 = zext i8 %1534 to i64
  %1536 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 1
  %1537 = load i8, i8 addrspace(4)* %1536, align 1, !tbaa !11
  %1538 = zext i8 %1537 to i64
  %1539 = shl nuw nsw i64 %1538, 8
  %1540 = or i64 %1539, %1535
  %1541 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 2
  %1542 = load i8, i8 addrspace(4)* %1541, align 1, !tbaa !11
  %1543 = zext i8 %1542 to i64
  %1544 = shl nuw nsw i64 %1543, 16
  %1545 = or i64 %1540, %1544
  %1546 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 3
  %1547 = load i8, i8 addrspace(4)* %1546, align 1, !tbaa !11
  %1548 = zext i8 %1547 to i64
  %1549 = shl nuw nsw i64 %1548, 24
  %1550 = or i64 %1545, %1549
  %1551 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 4
  %1552 = load i8, i8 addrspace(4)* %1551, align 1, !tbaa !11
  %1553 = zext i8 %1552 to i64
  %1554 = shl nuw nsw i64 %1553, 32
  %1555 = or i64 %1550, %1554
  %1556 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 5
  %1557 = load i8, i8 addrspace(4)* %1556, align 1, !tbaa !11
  %1558 = zext i8 %1557 to i64
  %1559 = shl nuw nsw i64 %1558, 40
  %1560 = or i64 %1555, %1559
  %1561 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 6
  %1562 = load i8, i8 addrspace(4)* %1561, align 1, !tbaa !11
  %1563 = zext i8 %1562 to i64
  %1564 = shl nuw nsw i64 %1563, 48
  %1565 = or i64 %1560, %1564
  %1566 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 7
  %1567 = load i8, i8 addrspace(4)* %1566, align 1, !tbaa !11
  %1568 = zext i8 %1567 to i64
  %1569 = shl nuw i64 %1568, 56
  %1570 = or i64 %1565, %1569
  %1571 = add nsw i32 %1528, -8
  %1572 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 8
  br label %1586

1573:                                             ; preds = %1531, %1573
  %1574 = phi i32 [ %1584, %1573 ], [ 0, %1531 ]
  %1575 = phi i64 [ %1583, %1573 ], [ 0, %1531 ]
  %1576 = zext i32 %1574 to i64
  %1577 = getelementptr inbounds i8, i8 addrspace(4)* %1527, i64 %1576
  %1578 = load i8, i8 addrspace(4)* %1577, align 1, !tbaa !11
  %1579 = zext i8 %1578 to i64
  %1580 = shl i32 %1574, 3
  %1581 = zext i32 %1580 to i64
  %1582 = shl nuw i64 %1579, %1581
  %1583 = or i64 %1582, %1575
  %1584 = add nuw nsw i32 %1574, 1
  %1585 = icmp eq i32 %1584, %1528
  br i1 %1585, label %1586, label %1573

1586:                                             ; preds = %1573, %1533, %1531
  %1587 = phi i8 addrspace(4)* [ %1572, %1533 ], [ %1527, %1531 ], [ %1527, %1573 ]
  %1588 = phi i32 [ %1571, %1533 ], [ 0, %1531 ], [ 0, %1573 ]
  %1589 = phi i64 [ %1570, %1533 ], [ 0, %1531 ], [ %1583, %1573 ]
  %1590 = icmp ugt i32 %1588, 7
  br i1 %1590, label %1593, label %1591

1591:                                             ; preds = %1586
  %1592 = icmp eq i32 %1588, 0
  br i1 %1592, label %1646, label %1633

1593:                                             ; preds = %1586
  %1594 = load i8, i8 addrspace(4)* %1587, align 1, !tbaa !11
  %1595 = zext i8 %1594 to i64
  %1596 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 1
  %1597 = load i8, i8 addrspace(4)* %1596, align 1, !tbaa !11
  %1598 = zext i8 %1597 to i64
  %1599 = shl nuw nsw i64 %1598, 8
  %1600 = or i64 %1599, %1595
  %1601 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 2
  %1602 = load i8, i8 addrspace(4)* %1601, align 1, !tbaa !11
  %1603 = zext i8 %1602 to i64
  %1604 = shl nuw nsw i64 %1603, 16
  %1605 = or i64 %1600, %1604
  %1606 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 3
  %1607 = load i8, i8 addrspace(4)* %1606, align 1, !tbaa !11
  %1608 = zext i8 %1607 to i64
  %1609 = shl nuw nsw i64 %1608, 24
  %1610 = or i64 %1605, %1609
  %1611 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 4
  %1612 = load i8, i8 addrspace(4)* %1611, align 1, !tbaa !11
  %1613 = zext i8 %1612 to i64
  %1614 = shl nuw nsw i64 %1613, 32
  %1615 = or i64 %1610, %1614
  %1616 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 5
  %1617 = load i8, i8 addrspace(4)* %1616, align 1, !tbaa !11
  %1618 = zext i8 %1617 to i64
  %1619 = shl nuw nsw i64 %1618, 40
  %1620 = or i64 %1615, %1619
  %1621 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 6
  %1622 = load i8, i8 addrspace(4)* %1621, align 1, !tbaa !11
  %1623 = zext i8 %1622 to i64
  %1624 = shl nuw nsw i64 %1623, 48
  %1625 = or i64 %1620, %1624
  %1626 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 7
  %1627 = load i8, i8 addrspace(4)* %1626, align 1, !tbaa !11
  %1628 = zext i8 %1627 to i64
  %1629 = shl nuw i64 %1628, 56
  %1630 = or i64 %1625, %1629
  %1631 = add nsw i32 %1588, -8
  %1632 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 8
  br label %1646

1633:                                             ; preds = %1591, %1633
  %1634 = phi i32 [ %1644, %1633 ], [ 0, %1591 ]
  %1635 = phi i64 [ %1643, %1633 ], [ 0, %1591 ]
  %1636 = zext i32 %1634 to i64
  %1637 = getelementptr inbounds i8, i8 addrspace(4)* %1587, i64 %1636
  %1638 = load i8, i8 addrspace(4)* %1637, align 1, !tbaa !11
  %1639 = zext i8 %1638 to i64
  %1640 = shl i32 %1634, 3
  %1641 = zext i32 %1640 to i64
  %1642 = shl nuw i64 %1639, %1641
  %1643 = or i64 %1642, %1635
  %1644 = add nuw nsw i32 %1634, 1
  %1645 = icmp eq i32 %1644, %1588
  br i1 %1645, label %1646, label %1633

1646:                                             ; preds = %1633, %1593, %1591
  %1647 = phi i8 addrspace(4)* [ %1632, %1593 ], [ %1587, %1591 ], [ %1587, %1633 ]
  %1648 = phi i32 [ %1631, %1593 ], [ 0, %1591 ], [ 0, %1633 ]
  %1649 = phi i64 [ %1630, %1593 ], [ 0, %1591 ], [ %1643, %1633 ]
  %1650 = icmp ugt i32 %1648, 7
  br i1 %1650, label %1653, label %1651

1651:                                             ; preds = %1646
  %1652 = icmp eq i32 %1648, 0
  br i1 %1652, label %1706, label %1693

1653:                                             ; preds = %1646
  %1654 = load i8, i8 addrspace(4)* %1647, align 1, !tbaa !11
  %1655 = zext i8 %1654 to i64
  %1656 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 1
  %1657 = load i8, i8 addrspace(4)* %1656, align 1, !tbaa !11
  %1658 = zext i8 %1657 to i64
  %1659 = shl nuw nsw i64 %1658, 8
  %1660 = or i64 %1659, %1655
  %1661 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 2
  %1662 = load i8, i8 addrspace(4)* %1661, align 1, !tbaa !11
  %1663 = zext i8 %1662 to i64
  %1664 = shl nuw nsw i64 %1663, 16
  %1665 = or i64 %1660, %1664
  %1666 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 3
  %1667 = load i8, i8 addrspace(4)* %1666, align 1, !tbaa !11
  %1668 = zext i8 %1667 to i64
  %1669 = shl nuw nsw i64 %1668, 24
  %1670 = or i64 %1665, %1669
  %1671 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 4
  %1672 = load i8, i8 addrspace(4)* %1671, align 1, !tbaa !11
  %1673 = zext i8 %1672 to i64
  %1674 = shl nuw nsw i64 %1673, 32
  %1675 = or i64 %1670, %1674
  %1676 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 5
  %1677 = load i8, i8 addrspace(4)* %1676, align 1, !tbaa !11
  %1678 = zext i8 %1677 to i64
  %1679 = shl nuw nsw i64 %1678, 40
  %1680 = or i64 %1675, %1679
  %1681 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 6
  %1682 = load i8, i8 addrspace(4)* %1681, align 1, !tbaa !11
  %1683 = zext i8 %1682 to i64
  %1684 = shl nuw nsw i64 %1683, 48
  %1685 = or i64 %1680, %1684
  %1686 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 7
  %1687 = load i8, i8 addrspace(4)* %1686, align 1, !tbaa !11
  %1688 = zext i8 %1687 to i64
  %1689 = shl nuw i64 %1688, 56
  %1690 = or i64 %1685, %1689
  %1691 = add nsw i32 %1648, -8
  %1692 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 8
  br label %1706

1693:                                             ; preds = %1651, %1693
  %1694 = phi i32 [ %1704, %1693 ], [ 0, %1651 ]
  %1695 = phi i64 [ %1703, %1693 ], [ 0, %1651 ]
  %1696 = zext i32 %1694 to i64
  %1697 = getelementptr inbounds i8, i8 addrspace(4)* %1647, i64 %1696
  %1698 = load i8, i8 addrspace(4)* %1697, align 1, !tbaa !11
  %1699 = zext i8 %1698 to i64
  %1700 = shl i32 %1694, 3
  %1701 = zext i32 %1700 to i64
  %1702 = shl nuw i64 %1699, %1701
  %1703 = or i64 %1702, %1695
  %1704 = add nuw nsw i32 %1694, 1
  %1705 = icmp eq i32 %1704, %1648
  br i1 %1705, label %1706, label %1693

1706:                                             ; preds = %1693, %1653, %1651
  %1707 = phi i8 addrspace(4)* [ %1692, %1653 ], [ %1647, %1651 ], [ %1647, %1693 ]
  %1708 = phi i32 [ %1691, %1653 ], [ 0, %1651 ], [ 0, %1693 ]
  %1709 = phi i64 [ %1690, %1653 ], [ 0, %1651 ], [ %1703, %1693 ]
  %1710 = icmp ugt i32 %1708, 7
  br i1 %1710, label %1713, label %1711

1711:                                             ; preds = %1706
  %1712 = icmp eq i32 %1708, 0
  br i1 %1712, label %1766, label %1753

1713:                                             ; preds = %1706
  %1714 = load i8, i8 addrspace(4)* %1707, align 1, !tbaa !11
  %1715 = zext i8 %1714 to i64
  %1716 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 1
  %1717 = load i8, i8 addrspace(4)* %1716, align 1, !tbaa !11
  %1718 = zext i8 %1717 to i64
  %1719 = shl nuw nsw i64 %1718, 8
  %1720 = or i64 %1719, %1715
  %1721 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 2
  %1722 = load i8, i8 addrspace(4)* %1721, align 1, !tbaa !11
  %1723 = zext i8 %1722 to i64
  %1724 = shl nuw nsw i64 %1723, 16
  %1725 = or i64 %1720, %1724
  %1726 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 3
  %1727 = load i8, i8 addrspace(4)* %1726, align 1, !tbaa !11
  %1728 = zext i8 %1727 to i64
  %1729 = shl nuw nsw i64 %1728, 24
  %1730 = or i64 %1725, %1729
  %1731 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 4
  %1732 = load i8, i8 addrspace(4)* %1731, align 1, !tbaa !11
  %1733 = zext i8 %1732 to i64
  %1734 = shl nuw nsw i64 %1733, 32
  %1735 = or i64 %1730, %1734
  %1736 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 5
  %1737 = load i8, i8 addrspace(4)* %1736, align 1, !tbaa !11
  %1738 = zext i8 %1737 to i64
  %1739 = shl nuw nsw i64 %1738, 40
  %1740 = or i64 %1735, %1739
  %1741 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 6
  %1742 = load i8, i8 addrspace(4)* %1741, align 1, !tbaa !11
  %1743 = zext i8 %1742 to i64
  %1744 = shl nuw nsw i64 %1743, 48
  %1745 = or i64 %1740, %1744
  %1746 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 7
  %1747 = load i8, i8 addrspace(4)* %1746, align 1, !tbaa !11
  %1748 = zext i8 %1747 to i64
  %1749 = shl nuw i64 %1748, 56
  %1750 = or i64 %1745, %1749
  %1751 = add nsw i32 %1708, -8
  %1752 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 8
  br label %1766

1753:                                             ; preds = %1711, %1753
  %1754 = phi i32 [ %1764, %1753 ], [ 0, %1711 ]
  %1755 = phi i64 [ %1763, %1753 ], [ 0, %1711 ]
  %1756 = zext i32 %1754 to i64
  %1757 = getelementptr inbounds i8, i8 addrspace(4)* %1707, i64 %1756
  %1758 = load i8, i8 addrspace(4)* %1757, align 1, !tbaa !11
  %1759 = zext i8 %1758 to i64
  %1760 = shl i32 %1754, 3
  %1761 = zext i32 %1760 to i64
  %1762 = shl nuw i64 %1759, %1761
  %1763 = or i64 %1762, %1755
  %1764 = add nuw nsw i32 %1754, 1
  %1765 = icmp eq i32 %1764, %1708
  br i1 %1765, label %1766, label %1753

1766:                                             ; preds = %1753, %1713, %1711
  %1767 = phi i8 addrspace(4)* [ %1752, %1713 ], [ %1707, %1711 ], [ %1707, %1753 ]
  %1768 = phi i32 [ %1751, %1713 ], [ 0, %1711 ], [ 0, %1753 ]
  %1769 = phi i64 [ %1750, %1713 ], [ 0, %1711 ], [ %1763, %1753 ]
  %1770 = icmp ugt i32 %1768, 7
  br i1 %1770, label %1773, label %1771

1771:                                             ; preds = %1766
  %1772 = icmp eq i32 %1768, 0
  br i1 %1772, label %1824, label %1811

1773:                                             ; preds = %1766
  %1774 = load i8, i8 addrspace(4)* %1767, align 1, !tbaa !11
  %1775 = zext i8 %1774 to i64
  %1776 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 1
  %1777 = load i8, i8 addrspace(4)* %1776, align 1, !tbaa !11
  %1778 = zext i8 %1777 to i64
  %1779 = shl nuw nsw i64 %1778, 8
  %1780 = or i64 %1779, %1775
  %1781 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 2
  %1782 = load i8, i8 addrspace(4)* %1781, align 1, !tbaa !11
  %1783 = zext i8 %1782 to i64
  %1784 = shl nuw nsw i64 %1783, 16
  %1785 = or i64 %1780, %1784
  %1786 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 3
  %1787 = load i8, i8 addrspace(4)* %1786, align 1, !tbaa !11
  %1788 = zext i8 %1787 to i64
  %1789 = shl nuw nsw i64 %1788, 24
  %1790 = or i64 %1785, %1789
  %1791 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 4
  %1792 = load i8, i8 addrspace(4)* %1791, align 1, !tbaa !11
  %1793 = zext i8 %1792 to i64
  %1794 = shl nuw nsw i64 %1793, 32
  %1795 = or i64 %1790, %1794
  %1796 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 5
  %1797 = load i8, i8 addrspace(4)* %1796, align 1, !tbaa !11
  %1798 = zext i8 %1797 to i64
  %1799 = shl nuw nsw i64 %1798, 40
  %1800 = or i64 %1795, %1799
  %1801 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 6
  %1802 = load i8, i8 addrspace(4)* %1801, align 1, !tbaa !11
  %1803 = zext i8 %1802 to i64
  %1804 = shl nuw nsw i64 %1803, 48
  %1805 = or i64 %1800, %1804
  %1806 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 7
  %1807 = load i8, i8 addrspace(4)* %1806, align 1, !tbaa !11
  %1808 = zext i8 %1807 to i64
  %1809 = shl nuw i64 %1808, 56
  %1810 = or i64 %1805, %1809
  br label %1824

1811:                                             ; preds = %1771, %1811
  %1812 = phi i32 [ %1822, %1811 ], [ 0, %1771 ]
  %1813 = phi i64 [ %1821, %1811 ], [ 0, %1771 ]
  %1814 = zext i32 %1812 to i64
  %1815 = getelementptr inbounds i8, i8 addrspace(4)* %1767, i64 %1814
  %1816 = load i8, i8 addrspace(4)* %1815, align 1, !tbaa !11
  %1817 = zext i8 %1816 to i64
  %1818 = shl i32 %1812, 3
  %1819 = zext i32 %1818 to i64
  %1820 = shl nuw i64 %1817, %1819
  %1821 = or i64 %1820, %1813
  %1822 = add nuw nsw i32 %1812, 1
  %1823 = icmp eq i32 %1822, %1768
  br i1 %1823, label %1824, label %1811

1824:                                             ; preds = %1811, %1773, %1771
  %1825 = phi i64 [ %1810, %1773 ], [ 0, %1771 ], [ %1821, %1811 ]
  %1826 = shl nuw nsw i64 %1407, 2
  %1827 = add nuw nsw i64 %1826, 28
  %1828 = and i64 %1827, 480
  %1829 = and i64 %1409, -225
  %1830 = or i64 %1829, %1828
  %1831 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %1830, i64 noundef %1469, i64 noundef %1529, i64 noundef %1589, i64 noundef %1649, i64 noundef %1709, i64 noundef %1769, i64 noundef %1825) #11
  %1832 = sub i64 %1399, %1407
  %1833 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 %1407
  %1834 = icmp eq i64 %1832, 0
  br i1 %1834, label %1835, label %1398

1835:                                             ; preds = %1824, %1390
  %1836 = phi <2 x i64> [ %1393, %1390 ], [ %1831, %1824 ]
  %1837 = extractelement <2 x i64> %1836, i64 0
  %1838 = zext i32 %1386 to i64
  %1839 = and i64 %1837, -227
  %1840 = or i64 %1839, 34
  %1841 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %1840, i64 noundef %1838, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1842 = icmp eq i32 %4, 0
  br i1 %1842, label %1843, label %2322

1843:                                             ; preds = %1835
  %1844 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 0), align 16, !tbaa !14
  %1845 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 1), align 4, !tbaa !14
  %1846 = add nsw i32 %1845, %1844
  %1847 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 2), align 8, !tbaa !14
  %1848 = add nsw i32 %1847, %1846
  %1849 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 3), align 4, !tbaa !14
  %1850 = add nsw i32 %1849, %1848
  %1851 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 4), align 16, !tbaa !14
  %1852 = add nsw i32 %1851, %1850
  %1853 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 5), align 4, !tbaa !14
  %1854 = add nsw i32 %1853, %1852
  %1855 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 6), align 8, !tbaa !14
  %1856 = add nsw i32 %1855, %1854
  %1857 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 7), align 4, !tbaa !14
  %1858 = add nsw i32 %1857, %1856
  %1859 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 8), align 16, !tbaa !14
  %1860 = add nsw i32 %1859, %1858
  %1861 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ7DotProdPiS_S_E4temp, i32 0, i32 9), align 4, !tbaa !14
  %1862 = add nsw i32 %1861, %1860
  %1863 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1864 = extractelement <2 x i64> %1863, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), label %1865, label %1869

1865:                                             ; preds = %1843
  %1866 = and i64 %1864, -225
  %1867 = or i64 %1866, 32
  %1868 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %1867, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2310

1869:                                             ; preds = %1843
  %1870 = and i64 %1864, 2
  %1871 = and i64 %1864, -3
  %1872 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1871, i64 0
  br label %1873

1873:                                             ; preds = %2299, %1869
  %1874 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.4, i64 0, i64 11) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([12 x i8]* addrspacecast ([12 x i8] addrspace(4)* @.str.4 to [12 x i8]*) to i64)), i64 1))), %1869 ], [ %2307, %2299 ]
  %1875 = phi i8 addrspace(4)* [ getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.4, i64 0, i64 0), %1869 ], [ %2308, %2299 ]
  %1876 = phi <2 x i64> [ %1872, %1869 ], [ %2306, %2299 ]
  %1877 = icmp ugt i64 %1874, 56
  %1878 = extractelement <2 x i64> %1876, i64 0
  %1879 = or i64 %1878, %1870
  %1880 = insertelement <2 x i64> poison, i64 %1879, i64 0
  %1881 = select i1 %1877, <2 x i64> %1876, <2 x i64> %1880
  %1882 = tail call i64 @llvm.umin.i64(i64 %1874, i64 56)
  %1883 = trunc i64 %1882 to i32
  %1884 = extractelement <2 x i64> %1881, i64 0
  %1885 = icmp ugt i32 %1883, 7
  br i1 %1885, label %1888, label %1886

1886:                                             ; preds = %1873
  %1887 = icmp eq i32 %1883, 0
  br i1 %1887, label %1941, label %1928

1888:                                             ; preds = %1873
  %1889 = load i8, i8 addrspace(4)* %1875, align 1, !tbaa !11
  %1890 = zext i8 %1889 to i64
  %1891 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 1
  %1892 = load i8, i8 addrspace(4)* %1891, align 1, !tbaa !11
  %1893 = zext i8 %1892 to i64
  %1894 = shl nuw nsw i64 %1893, 8
  %1895 = or i64 %1894, %1890
  %1896 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 2
  %1897 = load i8, i8 addrspace(4)* %1896, align 1, !tbaa !11
  %1898 = zext i8 %1897 to i64
  %1899 = shl nuw nsw i64 %1898, 16
  %1900 = or i64 %1895, %1899
  %1901 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 3
  %1902 = load i8, i8 addrspace(4)* %1901, align 1, !tbaa !11
  %1903 = zext i8 %1902 to i64
  %1904 = shl nuw nsw i64 %1903, 24
  %1905 = or i64 %1900, %1904
  %1906 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 4
  %1907 = load i8, i8 addrspace(4)* %1906, align 1, !tbaa !11
  %1908 = zext i8 %1907 to i64
  %1909 = shl nuw nsw i64 %1908, 32
  %1910 = or i64 %1905, %1909
  %1911 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 5
  %1912 = load i8, i8 addrspace(4)* %1911, align 1, !tbaa !11
  %1913 = zext i8 %1912 to i64
  %1914 = shl nuw nsw i64 %1913, 40
  %1915 = or i64 %1910, %1914
  %1916 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 6
  %1917 = load i8, i8 addrspace(4)* %1916, align 1, !tbaa !11
  %1918 = zext i8 %1917 to i64
  %1919 = shl nuw nsw i64 %1918, 48
  %1920 = or i64 %1915, %1919
  %1921 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 7
  %1922 = load i8, i8 addrspace(4)* %1921, align 1, !tbaa !11
  %1923 = zext i8 %1922 to i64
  %1924 = shl nuw i64 %1923, 56
  %1925 = or i64 %1920, %1924
  %1926 = add nsw i32 %1883, -8
  %1927 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 8
  br label %1941

1928:                                             ; preds = %1886, %1928
  %1929 = phi i32 [ %1939, %1928 ], [ 0, %1886 ]
  %1930 = phi i64 [ %1938, %1928 ], [ 0, %1886 ]
  %1931 = zext i32 %1929 to i64
  %1932 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 %1931
  %1933 = load i8, i8 addrspace(4)* %1932, align 1, !tbaa !11
  %1934 = zext i8 %1933 to i64
  %1935 = shl i32 %1929, 3
  %1936 = zext i32 %1935 to i64
  %1937 = shl nuw i64 %1934, %1936
  %1938 = or i64 %1937, %1930
  %1939 = add nuw nsw i32 %1929, 1
  %1940 = icmp eq i32 %1939, %1883
  br i1 %1940, label %1941, label %1928, !llvm.loop !12

1941:                                             ; preds = %1928, %1888, %1886
  %1942 = phi i8 addrspace(4)* [ %1927, %1888 ], [ %1875, %1886 ], [ %1875, %1928 ]
  %1943 = phi i32 [ %1926, %1888 ], [ 0, %1886 ], [ 0, %1928 ]
  %1944 = phi i64 [ %1925, %1888 ], [ 0, %1886 ], [ %1938, %1928 ]
  %1945 = icmp ugt i32 %1943, 7
  br i1 %1945, label %1948, label %1946

1946:                                             ; preds = %1941
  %1947 = icmp eq i32 %1943, 0
  br i1 %1947, label %2001, label %1988

1948:                                             ; preds = %1941
  %1949 = load i8, i8 addrspace(4)* %1942, align 1, !tbaa !11
  %1950 = zext i8 %1949 to i64
  %1951 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 1
  %1952 = load i8, i8 addrspace(4)* %1951, align 1, !tbaa !11
  %1953 = zext i8 %1952 to i64
  %1954 = shl nuw nsw i64 %1953, 8
  %1955 = or i64 %1954, %1950
  %1956 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 2
  %1957 = load i8, i8 addrspace(4)* %1956, align 1, !tbaa !11
  %1958 = zext i8 %1957 to i64
  %1959 = shl nuw nsw i64 %1958, 16
  %1960 = or i64 %1955, %1959
  %1961 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 3
  %1962 = load i8, i8 addrspace(4)* %1961, align 1, !tbaa !11
  %1963 = zext i8 %1962 to i64
  %1964 = shl nuw nsw i64 %1963, 24
  %1965 = or i64 %1960, %1964
  %1966 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 4
  %1967 = load i8, i8 addrspace(4)* %1966, align 1, !tbaa !11
  %1968 = zext i8 %1967 to i64
  %1969 = shl nuw nsw i64 %1968, 32
  %1970 = or i64 %1965, %1969
  %1971 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 5
  %1972 = load i8, i8 addrspace(4)* %1971, align 1, !tbaa !11
  %1973 = zext i8 %1972 to i64
  %1974 = shl nuw nsw i64 %1973, 40
  %1975 = or i64 %1970, %1974
  %1976 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 6
  %1977 = load i8, i8 addrspace(4)* %1976, align 1, !tbaa !11
  %1978 = zext i8 %1977 to i64
  %1979 = shl nuw nsw i64 %1978, 48
  %1980 = or i64 %1975, %1979
  %1981 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 7
  %1982 = load i8, i8 addrspace(4)* %1981, align 1, !tbaa !11
  %1983 = zext i8 %1982 to i64
  %1984 = shl nuw i64 %1983, 56
  %1985 = or i64 %1980, %1984
  %1986 = add nsw i32 %1943, -8
  %1987 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 8
  br label %2001

1988:                                             ; preds = %1946, %1988
  %1989 = phi i32 [ %1999, %1988 ], [ 0, %1946 ]
  %1990 = phi i64 [ %1998, %1988 ], [ 0, %1946 ]
  %1991 = zext i32 %1989 to i64
  %1992 = getelementptr inbounds i8, i8 addrspace(4)* %1942, i64 %1991
  %1993 = load i8, i8 addrspace(4)* %1992, align 1, !tbaa !11
  %1994 = zext i8 %1993 to i64
  %1995 = shl i32 %1989, 3
  %1996 = zext i32 %1995 to i64
  %1997 = shl nuw i64 %1994, %1996
  %1998 = or i64 %1997, %1990
  %1999 = add nuw nsw i32 %1989, 1
  %2000 = icmp eq i32 %1999, %1943
  br i1 %2000, label %2001, label %1988

2001:                                             ; preds = %1988, %1948, %1946
  %2002 = phi i8 addrspace(4)* [ %1987, %1948 ], [ %1942, %1946 ], [ %1942, %1988 ]
  %2003 = phi i32 [ %1986, %1948 ], [ 0, %1946 ], [ 0, %1988 ]
  %2004 = phi i64 [ %1985, %1948 ], [ 0, %1946 ], [ %1998, %1988 ]
  %2005 = icmp ugt i32 %2003, 7
  br i1 %2005, label %2008, label %2006

2006:                                             ; preds = %2001
  %2007 = icmp eq i32 %2003, 0
  br i1 %2007, label %2061, label %2048

2008:                                             ; preds = %2001
  %2009 = load i8, i8 addrspace(4)* %2002, align 1, !tbaa !11
  %2010 = zext i8 %2009 to i64
  %2011 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 1
  %2012 = load i8, i8 addrspace(4)* %2011, align 1, !tbaa !11
  %2013 = zext i8 %2012 to i64
  %2014 = shl nuw nsw i64 %2013, 8
  %2015 = or i64 %2014, %2010
  %2016 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 2
  %2017 = load i8, i8 addrspace(4)* %2016, align 1, !tbaa !11
  %2018 = zext i8 %2017 to i64
  %2019 = shl nuw nsw i64 %2018, 16
  %2020 = or i64 %2015, %2019
  %2021 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 3
  %2022 = load i8, i8 addrspace(4)* %2021, align 1, !tbaa !11
  %2023 = zext i8 %2022 to i64
  %2024 = shl nuw nsw i64 %2023, 24
  %2025 = or i64 %2020, %2024
  %2026 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 4
  %2027 = load i8, i8 addrspace(4)* %2026, align 1, !tbaa !11
  %2028 = zext i8 %2027 to i64
  %2029 = shl nuw nsw i64 %2028, 32
  %2030 = or i64 %2025, %2029
  %2031 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 5
  %2032 = load i8, i8 addrspace(4)* %2031, align 1, !tbaa !11
  %2033 = zext i8 %2032 to i64
  %2034 = shl nuw nsw i64 %2033, 40
  %2035 = or i64 %2030, %2034
  %2036 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 6
  %2037 = load i8, i8 addrspace(4)* %2036, align 1, !tbaa !11
  %2038 = zext i8 %2037 to i64
  %2039 = shl nuw nsw i64 %2038, 48
  %2040 = or i64 %2035, %2039
  %2041 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 7
  %2042 = load i8, i8 addrspace(4)* %2041, align 1, !tbaa !11
  %2043 = zext i8 %2042 to i64
  %2044 = shl nuw i64 %2043, 56
  %2045 = or i64 %2040, %2044
  %2046 = add nsw i32 %2003, -8
  %2047 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 8
  br label %2061

2048:                                             ; preds = %2006, %2048
  %2049 = phi i32 [ %2059, %2048 ], [ 0, %2006 ]
  %2050 = phi i64 [ %2058, %2048 ], [ 0, %2006 ]
  %2051 = zext i32 %2049 to i64
  %2052 = getelementptr inbounds i8, i8 addrspace(4)* %2002, i64 %2051
  %2053 = load i8, i8 addrspace(4)* %2052, align 1, !tbaa !11
  %2054 = zext i8 %2053 to i64
  %2055 = shl i32 %2049, 3
  %2056 = zext i32 %2055 to i64
  %2057 = shl nuw i64 %2054, %2056
  %2058 = or i64 %2057, %2050
  %2059 = add nuw nsw i32 %2049, 1
  %2060 = icmp eq i32 %2059, %2003
  br i1 %2060, label %2061, label %2048

2061:                                             ; preds = %2048, %2008, %2006
  %2062 = phi i8 addrspace(4)* [ %2047, %2008 ], [ %2002, %2006 ], [ %2002, %2048 ]
  %2063 = phi i32 [ %2046, %2008 ], [ 0, %2006 ], [ 0, %2048 ]
  %2064 = phi i64 [ %2045, %2008 ], [ 0, %2006 ], [ %2058, %2048 ]
  %2065 = icmp ugt i32 %2063, 7
  br i1 %2065, label %2068, label %2066

2066:                                             ; preds = %2061
  %2067 = icmp eq i32 %2063, 0
  br i1 %2067, label %2121, label %2108

2068:                                             ; preds = %2061
  %2069 = load i8, i8 addrspace(4)* %2062, align 1, !tbaa !11
  %2070 = zext i8 %2069 to i64
  %2071 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 1
  %2072 = load i8, i8 addrspace(4)* %2071, align 1, !tbaa !11
  %2073 = zext i8 %2072 to i64
  %2074 = shl nuw nsw i64 %2073, 8
  %2075 = or i64 %2074, %2070
  %2076 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 2
  %2077 = load i8, i8 addrspace(4)* %2076, align 1, !tbaa !11
  %2078 = zext i8 %2077 to i64
  %2079 = shl nuw nsw i64 %2078, 16
  %2080 = or i64 %2075, %2079
  %2081 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 3
  %2082 = load i8, i8 addrspace(4)* %2081, align 1, !tbaa !11
  %2083 = zext i8 %2082 to i64
  %2084 = shl nuw nsw i64 %2083, 24
  %2085 = or i64 %2080, %2084
  %2086 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 4
  %2087 = load i8, i8 addrspace(4)* %2086, align 1, !tbaa !11
  %2088 = zext i8 %2087 to i64
  %2089 = shl nuw nsw i64 %2088, 32
  %2090 = or i64 %2085, %2089
  %2091 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 5
  %2092 = load i8, i8 addrspace(4)* %2091, align 1, !tbaa !11
  %2093 = zext i8 %2092 to i64
  %2094 = shl nuw nsw i64 %2093, 40
  %2095 = or i64 %2090, %2094
  %2096 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 6
  %2097 = load i8, i8 addrspace(4)* %2096, align 1, !tbaa !11
  %2098 = zext i8 %2097 to i64
  %2099 = shl nuw nsw i64 %2098, 48
  %2100 = or i64 %2095, %2099
  %2101 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 7
  %2102 = load i8, i8 addrspace(4)* %2101, align 1, !tbaa !11
  %2103 = zext i8 %2102 to i64
  %2104 = shl nuw i64 %2103, 56
  %2105 = or i64 %2100, %2104
  %2106 = add nsw i32 %2063, -8
  %2107 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 8
  br label %2121

2108:                                             ; preds = %2066, %2108
  %2109 = phi i32 [ %2119, %2108 ], [ 0, %2066 ]
  %2110 = phi i64 [ %2118, %2108 ], [ 0, %2066 ]
  %2111 = zext i32 %2109 to i64
  %2112 = getelementptr inbounds i8, i8 addrspace(4)* %2062, i64 %2111
  %2113 = load i8, i8 addrspace(4)* %2112, align 1, !tbaa !11
  %2114 = zext i8 %2113 to i64
  %2115 = shl i32 %2109, 3
  %2116 = zext i32 %2115 to i64
  %2117 = shl nuw i64 %2114, %2116
  %2118 = or i64 %2117, %2110
  %2119 = add nuw nsw i32 %2109, 1
  %2120 = icmp eq i32 %2119, %2063
  br i1 %2120, label %2121, label %2108

2121:                                             ; preds = %2108, %2068, %2066
  %2122 = phi i8 addrspace(4)* [ %2107, %2068 ], [ %2062, %2066 ], [ %2062, %2108 ]
  %2123 = phi i32 [ %2106, %2068 ], [ 0, %2066 ], [ 0, %2108 ]
  %2124 = phi i64 [ %2105, %2068 ], [ 0, %2066 ], [ %2118, %2108 ]
  %2125 = icmp ugt i32 %2123, 7
  br i1 %2125, label %2128, label %2126

2126:                                             ; preds = %2121
  %2127 = icmp eq i32 %2123, 0
  br i1 %2127, label %2181, label %2168

2128:                                             ; preds = %2121
  %2129 = load i8, i8 addrspace(4)* %2122, align 1, !tbaa !11
  %2130 = zext i8 %2129 to i64
  %2131 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 1
  %2132 = load i8, i8 addrspace(4)* %2131, align 1, !tbaa !11
  %2133 = zext i8 %2132 to i64
  %2134 = shl nuw nsw i64 %2133, 8
  %2135 = or i64 %2134, %2130
  %2136 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 2
  %2137 = load i8, i8 addrspace(4)* %2136, align 1, !tbaa !11
  %2138 = zext i8 %2137 to i64
  %2139 = shl nuw nsw i64 %2138, 16
  %2140 = or i64 %2135, %2139
  %2141 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 3
  %2142 = load i8, i8 addrspace(4)* %2141, align 1, !tbaa !11
  %2143 = zext i8 %2142 to i64
  %2144 = shl nuw nsw i64 %2143, 24
  %2145 = or i64 %2140, %2144
  %2146 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 4
  %2147 = load i8, i8 addrspace(4)* %2146, align 1, !tbaa !11
  %2148 = zext i8 %2147 to i64
  %2149 = shl nuw nsw i64 %2148, 32
  %2150 = or i64 %2145, %2149
  %2151 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 5
  %2152 = load i8, i8 addrspace(4)* %2151, align 1, !tbaa !11
  %2153 = zext i8 %2152 to i64
  %2154 = shl nuw nsw i64 %2153, 40
  %2155 = or i64 %2150, %2154
  %2156 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 6
  %2157 = load i8, i8 addrspace(4)* %2156, align 1, !tbaa !11
  %2158 = zext i8 %2157 to i64
  %2159 = shl nuw nsw i64 %2158, 48
  %2160 = or i64 %2155, %2159
  %2161 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 7
  %2162 = load i8, i8 addrspace(4)* %2161, align 1, !tbaa !11
  %2163 = zext i8 %2162 to i64
  %2164 = shl nuw i64 %2163, 56
  %2165 = or i64 %2160, %2164
  %2166 = add nsw i32 %2123, -8
  %2167 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 8
  br label %2181

2168:                                             ; preds = %2126, %2168
  %2169 = phi i32 [ %2179, %2168 ], [ 0, %2126 ]
  %2170 = phi i64 [ %2178, %2168 ], [ 0, %2126 ]
  %2171 = zext i32 %2169 to i64
  %2172 = getelementptr inbounds i8, i8 addrspace(4)* %2122, i64 %2171
  %2173 = load i8, i8 addrspace(4)* %2172, align 1, !tbaa !11
  %2174 = zext i8 %2173 to i64
  %2175 = shl i32 %2169, 3
  %2176 = zext i32 %2175 to i64
  %2177 = shl nuw i64 %2174, %2176
  %2178 = or i64 %2177, %2170
  %2179 = add nuw nsw i32 %2169, 1
  %2180 = icmp eq i32 %2179, %2123
  br i1 %2180, label %2181, label %2168

2181:                                             ; preds = %2168, %2128, %2126
  %2182 = phi i8 addrspace(4)* [ %2167, %2128 ], [ %2122, %2126 ], [ %2122, %2168 ]
  %2183 = phi i32 [ %2166, %2128 ], [ 0, %2126 ], [ 0, %2168 ]
  %2184 = phi i64 [ %2165, %2128 ], [ 0, %2126 ], [ %2178, %2168 ]
  %2185 = icmp ugt i32 %2183, 7
  br i1 %2185, label %2188, label %2186

2186:                                             ; preds = %2181
  %2187 = icmp eq i32 %2183, 0
  br i1 %2187, label %2241, label %2228

2188:                                             ; preds = %2181
  %2189 = load i8, i8 addrspace(4)* %2182, align 1, !tbaa !11
  %2190 = zext i8 %2189 to i64
  %2191 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 1
  %2192 = load i8, i8 addrspace(4)* %2191, align 1, !tbaa !11
  %2193 = zext i8 %2192 to i64
  %2194 = shl nuw nsw i64 %2193, 8
  %2195 = or i64 %2194, %2190
  %2196 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 2
  %2197 = load i8, i8 addrspace(4)* %2196, align 1, !tbaa !11
  %2198 = zext i8 %2197 to i64
  %2199 = shl nuw nsw i64 %2198, 16
  %2200 = or i64 %2195, %2199
  %2201 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 3
  %2202 = load i8, i8 addrspace(4)* %2201, align 1, !tbaa !11
  %2203 = zext i8 %2202 to i64
  %2204 = shl nuw nsw i64 %2203, 24
  %2205 = or i64 %2200, %2204
  %2206 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 4
  %2207 = load i8, i8 addrspace(4)* %2206, align 1, !tbaa !11
  %2208 = zext i8 %2207 to i64
  %2209 = shl nuw nsw i64 %2208, 32
  %2210 = or i64 %2205, %2209
  %2211 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 5
  %2212 = load i8, i8 addrspace(4)* %2211, align 1, !tbaa !11
  %2213 = zext i8 %2212 to i64
  %2214 = shl nuw nsw i64 %2213, 40
  %2215 = or i64 %2210, %2214
  %2216 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 6
  %2217 = load i8, i8 addrspace(4)* %2216, align 1, !tbaa !11
  %2218 = zext i8 %2217 to i64
  %2219 = shl nuw nsw i64 %2218, 48
  %2220 = or i64 %2215, %2219
  %2221 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 7
  %2222 = load i8, i8 addrspace(4)* %2221, align 1, !tbaa !11
  %2223 = zext i8 %2222 to i64
  %2224 = shl nuw i64 %2223, 56
  %2225 = or i64 %2220, %2224
  %2226 = add nsw i32 %2183, -8
  %2227 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 8
  br label %2241

2228:                                             ; preds = %2186, %2228
  %2229 = phi i32 [ %2239, %2228 ], [ 0, %2186 ]
  %2230 = phi i64 [ %2238, %2228 ], [ 0, %2186 ]
  %2231 = zext i32 %2229 to i64
  %2232 = getelementptr inbounds i8, i8 addrspace(4)* %2182, i64 %2231
  %2233 = load i8, i8 addrspace(4)* %2232, align 1, !tbaa !11
  %2234 = zext i8 %2233 to i64
  %2235 = shl i32 %2229, 3
  %2236 = zext i32 %2235 to i64
  %2237 = shl nuw i64 %2234, %2236
  %2238 = or i64 %2237, %2230
  %2239 = add nuw nsw i32 %2229, 1
  %2240 = icmp eq i32 %2239, %2183
  br i1 %2240, label %2241, label %2228

2241:                                             ; preds = %2228, %2188, %2186
  %2242 = phi i8 addrspace(4)* [ %2227, %2188 ], [ %2182, %2186 ], [ %2182, %2228 ]
  %2243 = phi i32 [ %2226, %2188 ], [ 0, %2186 ], [ 0, %2228 ]
  %2244 = phi i64 [ %2225, %2188 ], [ 0, %2186 ], [ %2238, %2228 ]
  %2245 = icmp ugt i32 %2243, 7
  br i1 %2245, label %2248, label %2246

2246:                                             ; preds = %2241
  %2247 = icmp eq i32 %2243, 0
  br i1 %2247, label %2299, label %2286

2248:                                             ; preds = %2241
  %2249 = load i8, i8 addrspace(4)* %2242, align 1, !tbaa !11
  %2250 = zext i8 %2249 to i64
  %2251 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 1
  %2252 = load i8, i8 addrspace(4)* %2251, align 1, !tbaa !11
  %2253 = zext i8 %2252 to i64
  %2254 = shl nuw nsw i64 %2253, 8
  %2255 = or i64 %2254, %2250
  %2256 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 2
  %2257 = load i8, i8 addrspace(4)* %2256, align 1, !tbaa !11
  %2258 = zext i8 %2257 to i64
  %2259 = shl nuw nsw i64 %2258, 16
  %2260 = or i64 %2255, %2259
  %2261 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 3
  %2262 = load i8, i8 addrspace(4)* %2261, align 1, !tbaa !11
  %2263 = zext i8 %2262 to i64
  %2264 = shl nuw nsw i64 %2263, 24
  %2265 = or i64 %2260, %2264
  %2266 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 4
  %2267 = load i8, i8 addrspace(4)* %2266, align 1, !tbaa !11
  %2268 = zext i8 %2267 to i64
  %2269 = shl nuw nsw i64 %2268, 32
  %2270 = or i64 %2265, %2269
  %2271 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 5
  %2272 = load i8, i8 addrspace(4)* %2271, align 1, !tbaa !11
  %2273 = zext i8 %2272 to i64
  %2274 = shl nuw nsw i64 %2273, 40
  %2275 = or i64 %2270, %2274
  %2276 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 6
  %2277 = load i8, i8 addrspace(4)* %2276, align 1, !tbaa !11
  %2278 = zext i8 %2277 to i64
  %2279 = shl nuw nsw i64 %2278, 48
  %2280 = or i64 %2275, %2279
  %2281 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 7
  %2282 = load i8, i8 addrspace(4)* %2281, align 1, !tbaa !11
  %2283 = zext i8 %2282 to i64
  %2284 = shl nuw i64 %2283, 56
  %2285 = or i64 %2280, %2284
  br label %2299

2286:                                             ; preds = %2246, %2286
  %2287 = phi i32 [ %2297, %2286 ], [ 0, %2246 ]
  %2288 = phi i64 [ %2296, %2286 ], [ 0, %2246 ]
  %2289 = zext i32 %2287 to i64
  %2290 = getelementptr inbounds i8, i8 addrspace(4)* %2242, i64 %2289
  %2291 = load i8, i8 addrspace(4)* %2290, align 1, !tbaa !11
  %2292 = zext i8 %2291 to i64
  %2293 = shl i32 %2287, 3
  %2294 = zext i32 %2293 to i64
  %2295 = shl nuw i64 %2292, %2294
  %2296 = or i64 %2295, %2288
  %2297 = add nuw nsw i32 %2287, 1
  %2298 = icmp eq i32 %2297, %2243
  br i1 %2298, label %2299, label %2286

2299:                                             ; preds = %2286, %2248, %2246
  %2300 = phi i64 [ %2285, %2248 ], [ 0, %2246 ], [ %2296, %2286 ]
  %2301 = shl nuw nsw i64 %1882, 2
  %2302 = add nuw nsw i64 %2301, 28
  %2303 = and i64 %2302, 480
  %2304 = and i64 %1884, -225
  %2305 = or i64 %2304, %2303
  %2306 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %2305, i64 noundef %1944, i64 noundef %2004, i64 noundef %2064, i64 noundef %2124, i64 noundef %2184, i64 noundef %2244, i64 noundef %2300) #11
  %2307 = sub i64 %1874, %1882
  %2308 = getelementptr inbounds i8, i8 addrspace(4)* %1875, i64 %1882
  %2309 = icmp eq i64 %2307, 0
  br i1 %2309, label %2310, label %1873

2310:                                             ; preds = %2299, %1865
  %2311 = phi <2 x i64> [ %1868, %1865 ], [ %2306, %2299 ]
  %2312 = extractelement <2 x i64> %2311, i64 0
  %2313 = and i64 %2312, -225
  %2314 = or i64 %2313, 32
  %2315 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %2314, i64 noundef %469, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2316 = extractelement <2 x i64> %2315, i64 0
  %2317 = zext i32 %1862 to i64
  %2318 = and i64 %2316, -227
  %2319 = or i64 %2318, 34
  %2320 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %2319, i64 noundef %2317, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2321 = atomicrmw add i32 addrspace(1)* %2, i32 %1862 syncscope("agent-one-as") monotonic, align 4
  br label %2322

2322:                                             ; preds = %2310, %1835
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !7
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !26
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !27
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !26
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !20
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %110 = call i64 @llvm.read_register.i64(metadata !28) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !29
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !32
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !7
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !7
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !7
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !7
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !7
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !7
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !7
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !7
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !26
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !33
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !33
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !34
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !36
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !7
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !7
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !26
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !23
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !33
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !33
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !9, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !9, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!25 = !{!"hsa_signal_s", !8, i64 0}
!26 = !{!24, !8, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !8, i64 0, !8, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !8, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !8, i64 0}
!34 = !{!35, !8, i64 16}
!35 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !21, i64 24, !21, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!36 = !{!35, !21, i64 24}
