; ModuleID = '../data/hip_kernels/10806/1/main.cu'
source_filename = "../data/hip_kernels/10806/1/main.cu"
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

@_ZZ11oddevensortPiS_iE10swappedodd = internal unnamed_addr addrspace(3) global i8 undef, align 1
@_ZZ11oddevensortPiS_iE11swappedeven = internal unnamed_addr addrspace(3) global i8 undef, align 1
@.str = private unnamed_addr addrspace(4) constant [30 x i8] c" \0A Swapping at odd locations \00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [74 x i8] c"\0A Thread Id %d : is swapping %d <-> %d  \0A Thread Id %d : [%d] <-> [%d] \0A \00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11oddevensortPiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #1 {
  store i8 1, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE10swappedodd, align 1, !tbaa !4
  store i8 1, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE11swappedeven, align 1, !tbaa !4
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = sdiv i32 %2, 2
  %10 = add nsw i32 %9, -1
  %11 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 24
  %13 = bitcast i8 addrspace(4)* %12 to i64 addrspace(4)*
  br label %14

14:                                               ; preds = %1468, %3
  %15 = phi i1 [ true, %3 ], [ %1474, %1468 ]
  br i1 %15, label %16, label %966

16:                                               ; preds = %14
  %17 = load i64, i64 addrspace(4)* %13, align 8, !tbaa !8
  %18 = inttoptr i64 %17 to i8 addrspace(1)*
  %19 = addrspacecast i8 addrspace(1)* %18 to i8*
  %20 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %21 = extractelement <2 x i64> %20, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %22, label %26

22:                                               ; preds = %16
  %23 = and i64 %21, -227
  %24 = or i64 %23, 34
  %25 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %24, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %466

26:                                               ; preds = %16
  %27 = and i64 %21, -3
  %28 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %27, i64 0
  br label %29

29:                                               ; preds = %455, %26
  %30 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 29) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([30 x i8]* addrspacecast ([30 x i8] addrspace(4)* @.str to [30 x i8]*) to i64)), i64 1))), %26 ], [ %463, %455 ]
  %31 = phi i8 addrspace(4)* [ getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0), %26 ], [ %464, %455 ]
  %32 = phi <2 x i64> [ %28, %26 ], [ %462, %455 ]
  %33 = icmp ugt i64 %30, 56
  %34 = extractelement <2 x i64> %32, i64 0
  %35 = or i64 %34, 2
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
  %45 = load i8, i8 addrspace(4)* %31, align 1, !tbaa !12
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 1
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !12
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 8
  %51 = or i64 %50, %46
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 2
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !12
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 16
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 3
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !12
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 24
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 4
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !12
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 32
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 5
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !12
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 40
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 6
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !12
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 48
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 7
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !12
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
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !12
  %90 = zext i8 %89 to i64
  %91 = shl i32 %85, 3
  %92 = zext i32 %91 to i64
  %93 = shl nuw i64 %90, %92
  %94 = or i64 %93, %86
  %95 = add nuw nsw i32 %85, 1
  %96 = icmp eq i32 %95, %39
  br i1 %96, label %97, label %84, !llvm.loop !13

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
  %105 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !12
  %106 = zext i8 %105 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 1
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !12
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 8
  %111 = or i64 %110, %106
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 2
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !12
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 16
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 3
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !12
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 24
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 4
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !12
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 32
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 5
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !12
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 40
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 6
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !12
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 48
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 7
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !12
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
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !12
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
  %165 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !12
  %166 = zext i8 %165 to i64
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 1
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !12
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 8
  %171 = or i64 %170, %166
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 2
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !12
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 16
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 3
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !12
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 24
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 4
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !12
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 32
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 5
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !12
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 40
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 6
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !12
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 48
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 7
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !12
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
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !12
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
  %225 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !12
  %226 = zext i8 %225 to i64
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 1
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !12
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 8
  %231 = or i64 %230, %226
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 2
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !12
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 16
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 3
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !12
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 24
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 4
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !12
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 32
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 5
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !12
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 40
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 6
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !12
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 48
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 7
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !12
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
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !12
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
  %285 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !12
  %286 = zext i8 %285 to i64
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 1
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !12
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 8
  %291 = or i64 %290, %286
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 2
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !12
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 16
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 3
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !12
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 24
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 4
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !12
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 32
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 5
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !12
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 40
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 6
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !12
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 48
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 7
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !12
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
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !12
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
  %345 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !12
  %346 = zext i8 %345 to i64
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 1
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !12
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 8
  %351 = or i64 %350, %346
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 2
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !12
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 16
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 3
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !12
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 24
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 4
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !12
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 32
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 5
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !12
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 40
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 6
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !12
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 48
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 7
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !12
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
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !12
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
  %405 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !12
  %406 = zext i8 %405 to i64
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 1
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !12
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 8
  %411 = or i64 %410, %406
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 2
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !12
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 16
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 3
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !12
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 24
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 4
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !12
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 32
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 5
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !12
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 40
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 6
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !12
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 48
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 7
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !12
  %439 = zext i8 %438 to i64
  %440 = shl nuw i64 %439, 56
  %441 = or i64 %436, %440
  br label %455

442:                                              ; preds = %402, %442
  %443 = phi i32 [ %453, %442 ], [ 0, %402 ]
  %444 = phi i64 [ %452, %442 ], [ 0, %402 ]
  %445 = zext i32 %443 to i64
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 %445
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !12
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
  %462 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %461, i64 noundef %100, i64 noundef %160, i64 noundef %220, i64 noundef %280, i64 noundef %340, i64 noundef %400, i64 noundef %456) #11
  %463 = sub i64 %30, %38
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 %38
  %465 = icmp eq i64 %463, 0
  br i1 %465, label %466, label %29

466:                                              ; preds = %455, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i8 0, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE10swappedodd, align 1, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %467 = load i16, i16 addrspace(4)* %8, align 4, !range !15, !invariant.load !16
  %468 = zext i16 %467 to i32
  %469 = mul i32 %5, %468
  %470 = add i32 %469, %4
  %471 = icmp slt i32 %470, %9
  br i1 %471, label %472, label %965

472:                                              ; preds = %466
  %473 = shl nsw i32 %470, 1
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %474
  %476 = add nuw nsw i32 %473, 1
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %477
  %479 = bitcast i32 addrspace(1)* %475 to <2 x i32> addrspace(1)*
  %480 = load <2 x i32>, <2 x i32> addrspace(1)* %479, align 4, !tbaa !17
  %481 = extractelement <2 x i32> %480, i64 0
  %482 = extractelement <2 x i32> %480, i64 1
  %483 = icmp sgt i32 %481, %482
  br i1 %483, label %484, label %965

484:                                              ; preds = %472
  %485 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %486 = extractelement <2 x i64> %485, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %487, label %491

487:                                              ; preds = %484
  %488 = and i64 %486, -225
  %489 = or i64 %488, 32
  %490 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %489, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %932

491:                                              ; preds = %484
  %492 = and i64 %486, 2
  %493 = and i64 %486, -3
  %494 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %493, i64 0
  br label %495

495:                                              ; preds = %921, %491
  %496 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 73) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([74 x i8]* addrspacecast ([74 x i8] addrspace(4)* @.str.1 to [74 x i8]*) to i64)), i64 1))), %491 ], [ %929, %921 ]
  %497 = phi i8 addrspace(4)* [ getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %491 ], [ %930, %921 ]
  %498 = phi <2 x i64> [ %494, %491 ], [ %928, %921 ]
  %499 = icmp ugt i64 %496, 56
  %500 = extractelement <2 x i64> %498, i64 0
  %501 = or i64 %500, %492
  %502 = insertelement <2 x i64> poison, i64 %501, i64 0
  %503 = select i1 %499, <2 x i64> %498, <2 x i64> %502
  %504 = tail call i64 @llvm.umin.i64(i64 %496, i64 56)
  %505 = trunc i64 %504 to i32
  %506 = extractelement <2 x i64> %503, i64 0
  %507 = icmp ugt i32 %505, 7
  br i1 %507, label %510, label %508

508:                                              ; preds = %495
  %509 = icmp eq i32 %505, 0
  br i1 %509, label %563, label %550

510:                                              ; preds = %495
  %511 = load i8, i8 addrspace(4)* %497, align 1, !tbaa !12
  %512 = zext i8 %511 to i64
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 1
  %514 = load i8, i8 addrspace(4)* %513, align 1, !tbaa !12
  %515 = zext i8 %514 to i64
  %516 = shl nuw nsw i64 %515, 8
  %517 = or i64 %516, %512
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 2
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !12
  %520 = zext i8 %519 to i64
  %521 = shl nuw nsw i64 %520, 16
  %522 = or i64 %517, %521
  %523 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 3
  %524 = load i8, i8 addrspace(4)* %523, align 1, !tbaa !12
  %525 = zext i8 %524 to i64
  %526 = shl nuw nsw i64 %525, 24
  %527 = or i64 %522, %526
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 4
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !12
  %530 = zext i8 %529 to i64
  %531 = shl nuw nsw i64 %530, 32
  %532 = or i64 %527, %531
  %533 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 5
  %534 = load i8, i8 addrspace(4)* %533, align 1, !tbaa !12
  %535 = zext i8 %534 to i64
  %536 = shl nuw nsw i64 %535, 40
  %537 = or i64 %532, %536
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 6
  %539 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !12
  %540 = zext i8 %539 to i64
  %541 = shl nuw nsw i64 %540, 48
  %542 = or i64 %537, %541
  %543 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 7
  %544 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !12
  %545 = zext i8 %544 to i64
  %546 = shl nuw i64 %545, 56
  %547 = or i64 %542, %546
  %548 = add nsw i32 %505, -8
  %549 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 8
  br label %563

550:                                              ; preds = %508, %550
  %551 = phi i32 [ %561, %550 ], [ 0, %508 ]
  %552 = phi i64 [ %560, %550 ], [ 0, %508 ]
  %553 = zext i32 %551 to i64
  %554 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 %553
  %555 = load i8, i8 addrspace(4)* %554, align 1, !tbaa !12
  %556 = zext i8 %555 to i64
  %557 = shl i32 %551, 3
  %558 = zext i32 %557 to i64
  %559 = shl nuw i64 %556, %558
  %560 = or i64 %559, %552
  %561 = add nuw nsw i32 %551, 1
  %562 = icmp eq i32 %561, %505
  br i1 %562, label %563, label %550, !llvm.loop !13

563:                                              ; preds = %550, %510, %508
  %564 = phi i8 addrspace(4)* [ %549, %510 ], [ %497, %508 ], [ %497, %550 ]
  %565 = phi i32 [ %548, %510 ], [ 0, %508 ], [ 0, %550 ]
  %566 = phi i64 [ %547, %510 ], [ 0, %508 ], [ %560, %550 ]
  %567 = icmp ugt i32 %565, 7
  br i1 %567, label %570, label %568

568:                                              ; preds = %563
  %569 = icmp eq i32 %565, 0
  br i1 %569, label %623, label %610

570:                                              ; preds = %563
  %571 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !12
  %572 = zext i8 %571 to i64
  %573 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 1
  %574 = load i8, i8 addrspace(4)* %573, align 1, !tbaa !12
  %575 = zext i8 %574 to i64
  %576 = shl nuw nsw i64 %575, 8
  %577 = or i64 %576, %572
  %578 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 2
  %579 = load i8, i8 addrspace(4)* %578, align 1, !tbaa !12
  %580 = zext i8 %579 to i64
  %581 = shl nuw nsw i64 %580, 16
  %582 = or i64 %577, %581
  %583 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 3
  %584 = load i8, i8 addrspace(4)* %583, align 1, !tbaa !12
  %585 = zext i8 %584 to i64
  %586 = shl nuw nsw i64 %585, 24
  %587 = or i64 %582, %586
  %588 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 4
  %589 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !12
  %590 = zext i8 %589 to i64
  %591 = shl nuw nsw i64 %590, 32
  %592 = or i64 %587, %591
  %593 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 5
  %594 = load i8, i8 addrspace(4)* %593, align 1, !tbaa !12
  %595 = zext i8 %594 to i64
  %596 = shl nuw nsw i64 %595, 40
  %597 = or i64 %592, %596
  %598 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 6
  %599 = load i8, i8 addrspace(4)* %598, align 1, !tbaa !12
  %600 = zext i8 %599 to i64
  %601 = shl nuw nsw i64 %600, 48
  %602 = or i64 %597, %601
  %603 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 7
  %604 = load i8, i8 addrspace(4)* %603, align 1, !tbaa !12
  %605 = zext i8 %604 to i64
  %606 = shl nuw i64 %605, 56
  %607 = or i64 %602, %606
  %608 = add nsw i32 %565, -8
  %609 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 8
  br label %623

610:                                              ; preds = %568, %610
  %611 = phi i32 [ %621, %610 ], [ 0, %568 ]
  %612 = phi i64 [ %620, %610 ], [ 0, %568 ]
  %613 = zext i32 %611 to i64
  %614 = getelementptr inbounds i8, i8 addrspace(4)* %564, i64 %613
  %615 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !12
  %616 = zext i8 %615 to i64
  %617 = shl i32 %611, 3
  %618 = zext i32 %617 to i64
  %619 = shl nuw i64 %616, %618
  %620 = or i64 %619, %612
  %621 = add nuw nsw i32 %611, 1
  %622 = icmp eq i32 %621, %565
  br i1 %622, label %623, label %610

623:                                              ; preds = %610, %570, %568
  %624 = phi i8 addrspace(4)* [ %609, %570 ], [ %564, %568 ], [ %564, %610 ]
  %625 = phi i32 [ %608, %570 ], [ 0, %568 ], [ 0, %610 ]
  %626 = phi i64 [ %607, %570 ], [ 0, %568 ], [ %620, %610 ]
  %627 = icmp ugt i32 %625, 7
  br i1 %627, label %630, label %628

628:                                              ; preds = %623
  %629 = icmp eq i32 %625, 0
  br i1 %629, label %683, label %670

630:                                              ; preds = %623
  %631 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !12
  %632 = zext i8 %631 to i64
  %633 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 1
  %634 = load i8, i8 addrspace(4)* %633, align 1, !tbaa !12
  %635 = zext i8 %634 to i64
  %636 = shl nuw nsw i64 %635, 8
  %637 = or i64 %636, %632
  %638 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 2
  %639 = load i8, i8 addrspace(4)* %638, align 1, !tbaa !12
  %640 = zext i8 %639 to i64
  %641 = shl nuw nsw i64 %640, 16
  %642 = or i64 %637, %641
  %643 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 3
  %644 = load i8, i8 addrspace(4)* %643, align 1, !tbaa !12
  %645 = zext i8 %644 to i64
  %646 = shl nuw nsw i64 %645, 24
  %647 = or i64 %642, %646
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 4
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !12
  %650 = zext i8 %649 to i64
  %651 = shl nuw nsw i64 %650, 32
  %652 = or i64 %647, %651
  %653 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 5
  %654 = load i8, i8 addrspace(4)* %653, align 1, !tbaa !12
  %655 = zext i8 %654 to i64
  %656 = shl nuw nsw i64 %655, 40
  %657 = or i64 %652, %656
  %658 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 6
  %659 = load i8, i8 addrspace(4)* %658, align 1, !tbaa !12
  %660 = zext i8 %659 to i64
  %661 = shl nuw nsw i64 %660, 48
  %662 = or i64 %657, %661
  %663 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 7
  %664 = load i8, i8 addrspace(4)* %663, align 1, !tbaa !12
  %665 = zext i8 %664 to i64
  %666 = shl nuw i64 %665, 56
  %667 = or i64 %662, %666
  %668 = add nsw i32 %625, -8
  %669 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 8
  br label %683

670:                                              ; preds = %628, %670
  %671 = phi i32 [ %681, %670 ], [ 0, %628 ]
  %672 = phi i64 [ %680, %670 ], [ 0, %628 ]
  %673 = zext i32 %671 to i64
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %624, i64 %673
  %675 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !12
  %676 = zext i8 %675 to i64
  %677 = shl i32 %671, 3
  %678 = zext i32 %677 to i64
  %679 = shl nuw i64 %676, %678
  %680 = or i64 %679, %672
  %681 = add nuw nsw i32 %671, 1
  %682 = icmp eq i32 %681, %625
  br i1 %682, label %683, label %670

683:                                              ; preds = %670, %630, %628
  %684 = phi i8 addrspace(4)* [ %669, %630 ], [ %624, %628 ], [ %624, %670 ]
  %685 = phi i32 [ %668, %630 ], [ 0, %628 ], [ 0, %670 ]
  %686 = phi i64 [ %667, %630 ], [ 0, %628 ], [ %680, %670 ]
  %687 = icmp ugt i32 %685, 7
  br i1 %687, label %690, label %688

688:                                              ; preds = %683
  %689 = icmp eq i32 %685, 0
  br i1 %689, label %743, label %730

690:                                              ; preds = %683
  %691 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !12
  %692 = zext i8 %691 to i64
  %693 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 1
  %694 = load i8, i8 addrspace(4)* %693, align 1, !tbaa !12
  %695 = zext i8 %694 to i64
  %696 = shl nuw nsw i64 %695, 8
  %697 = or i64 %696, %692
  %698 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 2
  %699 = load i8, i8 addrspace(4)* %698, align 1, !tbaa !12
  %700 = zext i8 %699 to i64
  %701 = shl nuw nsw i64 %700, 16
  %702 = or i64 %697, %701
  %703 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 3
  %704 = load i8, i8 addrspace(4)* %703, align 1, !tbaa !12
  %705 = zext i8 %704 to i64
  %706 = shl nuw nsw i64 %705, 24
  %707 = or i64 %702, %706
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 4
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !12
  %710 = zext i8 %709 to i64
  %711 = shl nuw nsw i64 %710, 32
  %712 = or i64 %707, %711
  %713 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 5
  %714 = load i8, i8 addrspace(4)* %713, align 1, !tbaa !12
  %715 = zext i8 %714 to i64
  %716 = shl nuw nsw i64 %715, 40
  %717 = or i64 %712, %716
  %718 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 6
  %719 = load i8, i8 addrspace(4)* %718, align 1, !tbaa !12
  %720 = zext i8 %719 to i64
  %721 = shl nuw nsw i64 %720, 48
  %722 = or i64 %717, %721
  %723 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 7
  %724 = load i8, i8 addrspace(4)* %723, align 1, !tbaa !12
  %725 = zext i8 %724 to i64
  %726 = shl nuw i64 %725, 56
  %727 = or i64 %722, %726
  %728 = add nsw i32 %685, -8
  %729 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 8
  br label %743

730:                                              ; preds = %688, %730
  %731 = phi i32 [ %741, %730 ], [ 0, %688 ]
  %732 = phi i64 [ %740, %730 ], [ 0, %688 ]
  %733 = zext i32 %731 to i64
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %684, i64 %733
  %735 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !12
  %736 = zext i8 %735 to i64
  %737 = shl i32 %731, 3
  %738 = zext i32 %737 to i64
  %739 = shl nuw i64 %736, %738
  %740 = or i64 %739, %732
  %741 = add nuw nsw i32 %731, 1
  %742 = icmp eq i32 %741, %685
  br i1 %742, label %743, label %730

743:                                              ; preds = %730, %690, %688
  %744 = phi i8 addrspace(4)* [ %729, %690 ], [ %684, %688 ], [ %684, %730 ]
  %745 = phi i32 [ %728, %690 ], [ 0, %688 ], [ 0, %730 ]
  %746 = phi i64 [ %727, %690 ], [ 0, %688 ], [ %740, %730 ]
  %747 = icmp ugt i32 %745, 7
  br i1 %747, label %750, label %748

748:                                              ; preds = %743
  %749 = icmp eq i32 %745, 0
  br i1 %749, label %803, label %790

750:                                              ; preds = %743
  %751 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !12
  %752 = zext i8 %751 to i64
  %753 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 1
  %754 = load i8, i8 addrspace(4)* %753, align 1, !tbaa !12
  %755 = zext i8 %754 to i64
  %756 = shl nuw nsw i64 %755, 8
  %757 = or i64 %756, %752
  %758 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 2
  %759 = load i8, i8 addrspace(4)* %758, align 1, !tbaa !12
  %760 = zext i8 %759 to i64
  %761 = shl nuw nsw i64 %760, 16
  %762 = or i64 %757, %761
  %763 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 3
  %764 = load i8, i8 addrspace(4)* %763, align 1, !tbaa !12
  %765 = zext i8 %764 to i64
  %766 = shl nuw nsw i64 %765, 24
  %767 = or i64 %762, %766
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 4
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !12
  %770 = zext i8 %769 to i64
  %771 = shl nuw nsw i64 %770, 32
  %772 = or i64 %767, %771
  %773 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 5
  %774 = load i8, i8 addrspace(4)* %773, align 1, !tbaa !12
  %775 = zext i8 %774 to i64
  %776 = shl nuw nsw i64 %775, 40
  %777 = or i64 %772, %776
  %778 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 6
  %779 = load i8, i8 addrspace(4)* %778, align 1, !tbaa !12
  %780 = zext i8 %779 to i64
  %781 = shl nuw nsw i64 %780, 48
  %782 = or i64 %777, %781
  %783 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 7
  %784 = load i8, i8 addrspace(4)* %783, align 1, !tbaa !12
  %785 = zext i8 %784 to i64
  %786 = shl nuw i64 %785, 56
  %787 = or i64 %782, %786
  %788 = add nsw i32 %745, -8
  %789 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 8
  br label %803

790:                                              ; preds = %748, %790
  %791 = phi i32 [ %801, %790 ], [ 0, %748 ]
  %792 = phi i64 [ %800, %790 ], [ 0, %748 ]
  %793 = zext i32 %791 to i64
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %744, i64 %793
  %795 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !12
  %796 = zext i8 %795 to i64
  %797 = shl i32 %791, 3
  %798 = zext i32 %797 to i64
  %799 = shl nuw i64 %796, %798
  %800 = or i64 %799, %792
  %801 = add nuw nsw i32 %791, 1
  %802 = icmp eq i32 %801, %745
  br i1 %802, label %803, label %790

803:                                              ; preds = %790, %750, %748
  %804 = phi i8 addrspace(4)* [ %789, %750 ], [ %744, %748 ], [ %744, %790 ]
  %805 = phi i32 [ %788, %750 ], [ 0, %748 ], [ 0, %790 ]
  %806 = phi i64 [ %787, %750 ], [ 0, %748 ], [ %800, %790 ]
  %807 = icmp ugt i32 %805, 7
  br i1 %807, label %810, label %808

808:                                              ; preds = %803
  %809 = icmp eq i32 %805, 0
  br i1 %809, label %863, label %850

810:                                              ; preds = %803
  %811 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !12
  %812 = zext i8 %811 to i64
  %813 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 1
  %814 = load i8, i8 addrspace(4)* %813, align 1, !tbaa !12
  %815 = zext i8 %814 to i64
  %816 = shl nuw nsw i64 %815, 8
  %817 = or i64 %816, %812
  %818 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 2
  %819 = load i8, i8 addrspace(4)* %818, align 1, !tbaa !12
  %820 = zext i8 %819 to i64
  %821 = shl nuw nsw i64 %820, 16
  %822 = or i64 %817, %821
  %823 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 3
  %824 = load i8, i8 addrspace(4)* %823, align 1, !tbaa !12
  %825 = zext i8 %824 to i64
  %826 = shl nuw nsw i64 %825, 24
  %827 = or i64 %822, %826
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 4
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !12
  %830 = zext i8 %829 to i64
  %831 = shl nuw nsw i64 %830, 32
  %832 = or i64 %827, %831
  %833 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 5
  %834 = load i8, i8 addrspace(4)* %833, align 1, !tbaa !12
  %835 = zext i8 %834 to i64
  %836 = shl nuw nsw i64 %835, 40
  %837 = or i64 %832, %836
  %838 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 6
  %839 = load i8, i8 addrspace(4)* %838, align 1, !tbaa !12
  %840 = zext i8 %839 to i64
  %841 = shl nuw nsw i64 %840, 48
  %842 = or i64 %837, %841
  %843 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 7
  %844 = load i8, i8 addrspace(4)* %843, align 1, !tbaa !12
  %845 = zext i8 %844 to i64
  %846 = shl nuw i64 %845, 56
  %847 = or i64 %842, %846
  %848 = add nsw i32 %805, -8
  %849 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 8
  br label %863

850:                                              ; preds = %808, %850
  %851 = phi i32 [ %861, %850 ], [ 0, %808 ]
  %852 = phi i64 [ %860, %850 ], [ 0, %808 ]
  %853 = zext i32 %851 to i64
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %804, i64 %853
  %855 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !12
  %856 = zext i8 %855 to i64
  %857 = shl i32 %851, 3
  %858 = zext i32 %857 to i64
  %859 = shl nuw i64 %856, %858
  %860 = or i64 %859, %852
  %861 = add nuw nsw i32 %851, 1
  %862 = icmp eq i32 %861, %805
  br i1 %862, label %863, label %850

863:                                              ; preds = %850, %810, %808
  %864 = phi i8 addrspace(4)* [ %849, %810 ], [ %804, %808 ], [ %804, %850 ]
  %865 = phi i32 [ %848, %810 ], [ 0, %808 ], [ 0, %850 ]
  %866 = phi i64 [ %847, %810 ], [ 0, %808 ], [ %860, %850 ]
  %867 = icmp ugt i32 %865, 7
  br i1 %867, label %870, label %868

868:                                              ; preds = %863
  %869 = icmp eq i32 %865, 0
  br i1 %869, label %921, label %908

870:                                              ; preds = %863
  %871 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !12
  %872 = zext i8 %871 to i64
  %873 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 1
  %874 = load i8, i8 addrspace(4)* %873, align 1, !tbaa !12
  %875 = zext i8 %874 to i64
  %876 = shl nuw nsw i64 %875, 8
  %877 = or i64 %876, %872
  %878 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 2
  %879 = load i8, i8 addrspace(4)* %878, align 1, !tbaa !12
  %880 = zext i8 %879 to i64
  %881 = shl nuw nsw i64 %880, 16
  %882 = or i64 %877, %881
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 3
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !12
  %885 = zext i8 %884 to i64
  %886 = shl nuw nsw i64 %885, 24
  %887 = or i64 %882, %886
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 4
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !12
  %890 = zext i8 %889 to i64
  %891 = shl nuw nsw i64 %890, 32
  %892 = or i64 %887, %891
  %893 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 5
  %894 = load i8, i8 addrspace(4)* %893, align 1, !tbaa !12
  %895 = zext i8 %894 to i64
  %896 = shl nuw nsw i64 %895, 40
  %897 = or i64 %892, %896
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 6
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !12
  %900 = zext i8 %899 to i64
  %901 = shl nuw nsw i64 %900, 48
  %902 = or i64 %897, %901
  %903 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 7
  %904 = load i8, i8 addrspace(4)* %903, align 1, !tbaa !12
  %905 = zext i8 %904 to i64
  %906 = shl nuw i64 %905, 56
  %907 = or i64 %902, %906
  br label %921

908:                                              ; preds = %868, %908
  %909 = phi i32 [ %919, %908 ], [ 0, %868 ]
  %910 = phi i64 [ %918, %908 ], [ 0, %868 ]
  %911 = zext i32 %909 to i64
  %912 = getelementptr inbounds i8, i8 addrspace(4)* %864, i64 %911
  %913 = load i8, i8 addrspace(4)* %912, align 1, !tbaa !12
  %914 = zext i8 %913 to i64
  %915 = shl i32 %909, 3
  %916 = zext i32 %915 to i64
  %917 = shl nuw i64 %914, %916
  %918 = or i64 %917, %910
  %919 = add nuw nsw i32 %909, 1
  %920 = icmp eq i32 %919, %865
  br i1 %920, label %921, label %908

921:                                              ; preds = %908, %870, %868
  %922 = phi i64 [ %907, %870 ], [ 0, %868 ], [ %918, %908 ]
  %923 = shl nuw nsw i64 %504, 2
  %924 = add nuw nsw i64 %923, 28
  %925 = and i64 %924, 480
  %926 = and i64 %506, -225
  %927 = or i64 %926, %925
  %928 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %927, i64 noundef %566, i64 noundef %626, i64 noundef %686, i64 noundef %746, i64 noundef %806, i64 noundef %866, i64 noundef %922) #11
  %929 = sub i64 %496, %504
  %930 = getelementptr inbounds i8, i8 addrspace(4)* %497, i64 %504
  %931 = icmp eq i64 %929, 0
  br i1 %931, label %932, label %495

932:                                              ; preds = %921, %487
  %933 = phi <2 x i64> [ %490, %487 ], [ %928, %921 ]
  %934 = extractelement <2 x i64> %933, i64 0
  %935 = zext i32 %470 to i64
  %936 = and i64 %934, -225
  %937 = or i64 %936, 32
  %938 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %937, i64 noundef %935, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %939 = extractelement <2 x i64> %938, i64 0
  %940 = zext i32 %481 to i64
  %941 = and i64 %939, -225
  %942 = or i64 %941, 32
  %943 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %942, i64 noundef %940, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %944 = extractelement <2 x i64> %943, i64 0
  %945 = zext i32 %482 to i64
  %946 = and i64 %944, -225
  %947 = or i64 %946, 32
  %948 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %947, i64 noundef %945, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %949 = extractelement <2 x i64> %948, i64 0
  %950 = and i64 %949, -225
  %951 = or i64 %950, 32
  %952 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %951, i64 noundef %935, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %953 = extractelement <2 x i64> %952, i64 0
  %954 = zext i32 %473 to i64
  %955 = and i64 %953, -225
  %956 = or i64 %955, 32
  %957 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %956, i64 noundef %954, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %958 = extractelement <2 x i64> %957, i64 0
  %959 = zext i32 %476 to i64
  %960 = and i64 %958, -227
  %961 = or i64 %960, 34
  %962 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %961, i64 noundef %959, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %963 = load i32, i32 addrspace(1)* %475, align 4, !tbaa !17
  %964 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !17
  store i32 %964, i32 addrspace(1)* %475, align 4, !tbaa !17
  store i32 %963, i32 addrspace(1)* %478, align 4, !tbaa !17
  store i8 1, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE10swappedodd, align 1, !tbaa !4
  br label %965

965:                                              ; preds = %472, %932, %466
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %1468

966:                                              ; preds = %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i8 0, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE11swappedeven, align 1, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %967 = load i16, i16 addrspace(4)* %8, align 4, !range !15, !invariant.load !16
  %968 = zext i16 %967 to i32
  %969 = mul i32 %5, %968
  %970 = add i32 %969, %4
  %971 = icmp slt i32 %970, %10
  br i1 %971, label %972, label %1467

972:                                              ; preds = %966
  %973 = shl nsw i32 %970, 1
  %974 = add nuw nsw i32 %973, 1
  %975 = sext i32 %974 to i64
  %976 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %975
  %977 = load i32, i32 addrspace(1)* %976, align 4, !tbaa !17
  %978 = add nsw i32 %973, 2
  %979 = sext i32 %978 to i64
  %980 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %979
  %981 = load i32, i32 addrspace(1)* %980, align 4, !tbaa !17
  %982 = icmp sgt i32 %977, %981
  br i1 %982, label %983, label %1467

983:                                              ; preds = %972
  %984 = load i64, i64 addrspace(4)* %13, align 8, !tbaa !8
  %985 = inttoptr i64 %984 to i8 addrspace(1)*
  %986 = addrspacecast i8 addrspace(1)* %985 to i8*
  %987 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %988 = extractelement <2 x i64> %987, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %989, label %993

989:                                              ; preds = %983
  %990 = and i64 %988, -225
  %991 = or i64 %990, 32
  %992 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %991, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1434

993:                                              ; preds = %983
  %994 = and i64 %988, 2
  %995 = and i64 %988, -3
  %996 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %995, i64 0
  br label %997

997:                                              ; preds = %1423, %993
  %998 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 73) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([74 x i8]* addrspacecast ([74 x i8] addrspace(4)* @.str.1 to [74 x i8]*) to i64)), i64 1))), %993 ], [ %1431, %1423 ]
  %999 = phi i8 addrspace(4)* [ getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %993 ], [ %1432, %1423 ]
  %1000 = phi <2 x i64> [ %996, %993 ], [ %1430, %1423 ]
  %1001 = icmp ugt i64 %998, 56
  %1002 = extractelement <2 x i64> %1000, i64 0
  %1003 = or i64 %1002, %994
  %1004 = insertelement <2 x i64> poison, i64 %1003, i64 0
  %1005 = select i1 %1001, <2 x i64> %1000, <2 x i64> %1004
  %1006 = tail call i64 @llvm.umin.i64(i64 %998, i64 56)
  %1007 = trunc i64 %1006 to i32
  %1008 = extractelement <2 x i64> %1005, i64 0
  %1009 = icmp ugt i32 %1007, 7
  br i1 %1009, label %1012, label %1010

1010:                                             ; preds = %997
  %1011 = icmp eq i32 %1007, 0
  br i1 %1011, label %1065, label %1052

1012:                                             ; preds = %997
  %1013 = load i8, i8 addrspace(4)* %999, align 1, !tbaa !12
  %1014 = zext i8 %1013 to i64
  %1015 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 1
  %1016 = load i8, i8 addrspace(4)* %1015, align 1, !tbaa !12
  %1017 = zext i8 %1016 to i64
  %1018 = shl nuw nsw i64 %1017, 8
  %1019 = or i64 %1018, %1014
  %1020 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 2
  %1021 = load i8, i8 addrspace(4)* %1020, align 1, !tbaa !12
  %1022 = zext i8 %1021 to i64
  %1023 = shl nuw nsw i64 %1022, 16
  %1024 = or i64 %1019, %1023
  %1025 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 3
  %1026 = load i8, i8 addrspace(4)* %1025, align 1, !tbaa !12
  %1027 = zext i8 %1026 to i64
  %1028 = shl nuw nsw i64 %1027, 24
  %1029 = or i64 %1024, %1028
  %1030 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 4
  %1031 = load i8, i8 addrspace(4)* %1030, align 1, !tbaa !12
  %1032 = zext i8 %1031 to i64
  %1033 = shl nuw nsw i64 %1032, 32
  %1034 = or i64 %1029, %1033
  %1035 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 5
  %1036 = load i8, i8 addrspace(4)* %1035, align 1, !tbaa !12
  %1037 = zext i8 %1036 to i64
  %1038 = shl nuw nsw i64 %1037, 40
  %1039 = or i64 %1034, %1038
  %1040 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 6
  %1041 = load i8, i8 addrspace(4)* %1040, align 1, !tbaa !12
  %1042 = zext i8 %1041 to i64
  %1043 = shl nuw nsw i64 %1042, 48
  %1044 = or i64 %1039, %1043
  %1045 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 7
  %1046 = load i8, i8 addrspace(4)* %1045, align 1, !tbaa !12
  %1047 = zext i8 %1046 to i64
  %1048 = shl nuw i64 %1047, 56
  %1049 = or i64 %1044, %1048
  %1050 = add nsw i32 %1007, -8
  %1051 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 8
  br label %1065

1052:                                             ; preds = %1010, %1052
  %1053 = phi i32 [ %1063, %1052 ], [ 0, %1010 ]
  %1054 = phi i64 [ %1062, %1052 ], [ 0, %1010 ]
  %1055 = zext i32 %1053 to i64
  %1056 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 %1055
  %1057 = load i8, i8 addrspace(4)* %1056, align 1, !tbaa !12
  %1058 = zext i8 %1057 to i64
  %1059 = shl i32 %1053, 3
  %1060 = zext i32 %1059 to i64
  %1061 = shl nuw i64 %1058, %1060
  %1062 = or i64 %1061, %1054
  %1063 = add nuw nsw i32 %1053, 1
  %1064 = icmp eq i32 %1063, %1007
  br i1 %1064, label %1065, label %1052, !llvm.loop !13

1065:                                             ; preds = %1052, %1012, %1010
  %1066 = phi i8 addrspace(4)* [ %1051, %1012 ], [ %999, %1010 ], [ %999, %1052 ]
  %1067 = phi i32 [ %1050, %1012 ], [ 0, %1010 ], [ 0, %1052 ]
  %1068 = phi i64 [ %1049, %1012 ], [ 0, %1010 ], [ %1062, %1052 ]
  %1069 = icmp ugt i32 %1067, 7
  br i1 %1069, label %1072, label %1070

1070:                                             ; preds = %1065
  %1071 = icmp eq i32 %1067, 0
  br i1 %1071, label %1125, label %1112

1072:                                             ; preds = %1065
  %1073 = load i8, i8 addrspace(4)* %1066, align 1, !tbaa !12
  %1074 = zext i8 %1073 to i64
  %1075 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 1
  %1076 = load i8, i8 addrspace(4)* %1075, align 1, !tbaa !12
  %1077 = zext i8 %1076 to i64
  %1078 = shl nuw nsw i64 %1077, 8
  %1079 = or i64 %1078, %1074
  %1080 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 2
  %1081 = load i8, i8 addrspace(4)* %1080, align 1, !tbaa !12
  %1082 = zext i8 %1081 to i64
  %1083 = shl nuw nsw i64 %1082, 16
  %1084 = or i64 %1079, %1083
  %1085 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 3
  %1086 = load i8, i8 addrspace(4)* %1085, align 1, !tbaa !12
  %1087 = zext i8 %1086 to i64
  %1088 = shl nuw nsw i64 %1087, 24
  %1089 = or i64 %1084, %1088
  %1090 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 4
  %1091 = load i8, i8 addrspace(4)* %1090, align 1, !tbaa !12
  %1092 = zext i8 %1091 to i64
  %1093 = shl nuw nsw i64 %1092, 32
  %1094 = or i64 %1089, %1093
  %1095 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 5
  %1096 = load i8, i8 addrspace(4)* %1095, align 1, !tbaa !12
  %1097 = zext i8 %1096 to i64
  %1098 = shl nuw nsw i64 %1097, 40
  %1099 = or i64 %1094, %1098
  %1100 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 6
  %1101 = load i8, i8 addrspace(4)* %1100, align 1, !tbaa !12
  %1102 = zext i8 %1101 to i64
  %1103 = shl nuw nsw i64 %1102, 48
  %1104 = or i64 %1099, %1103
  %1105 = getelementptr inbounds i8, i8 addrspace(4)* %1066, i64 7
  %1106 = load i8, i8 addrspace(4)* %1105, align 1, !tbaa !12
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
  %1117 = load i8, i8 addrspace(4)* %1116, align 1, !tbaa !12
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
  %1133 = load i8, i8 addrspace(4)* %1126, align 1, !tbaa !12
  %1134 = zext i8 %1133 to i64
  %1135 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 1
  %1136 = load i8, i8 addrspace(4)* %1135, align 1, !tbaa !12
  %1137 = zext i8 %1136 to i64
  %1138 = shl nuw nsw i64 %1137, 8
  %1139 = or i64 %1138, %1134
  %1140 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 2
  %1141 = load i8, i8 addrspace(4)* %1140, align 1, !tbaa !12
  %1142 = zext i8 %1141 to i64
  %1143 = shl nuw nsw i64 %1142, 16
  %1144 = or i64 %1139, %1143
  %1145 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 3
  %1146 = load i8, i8 addrspace(4)* %1145, align 1, !tbaa !12
  %1147 = zext i8 %1146 to i64
  %1148 = shl nuw nsw i64 %1147, 24
  %1149 = or i64 %1144, %1148
  %1150 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 4
  %1151 = load i8, i8 addrspace(4)* %1150, align 1, !tbaa !12
  %1152 = zext i8 %1151 to i64
  %1153 = shl nuw nsw i64 %1152, 32
  %1154 = or i64 %1149, %1153
  %1155 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 5
  %1156 = load i8, i8 addrspace(4)* %1155, align 1, !tbaa !12
  %1157 = zext i8 %1156 to i64
  %1158 = shl nuw nsw i64 %1157, 40
  %1159 = or i64 %1154, %1158
  %1160 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 6
  %1161 = load i8, i8 addrspace(4)* %1160, align 1, !tbaa !12
  %1162 = zext i8 %1161 to i64
  %1163 = shl nuw nsw i64 %1162, 48
  %1164 = or i64 %1159, %1163
  %1165 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 7
  %1166 = load i8, i8 addrspace(4)* %1165, align 1, !tbaa !12
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
  %1177 = load i8, i8 addrspace(4)* %1176, align 1, !tbaa !12
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
  %1193 = load i8, i8 addrspace(4)* %1186, align 1, !tbaa !12
  %1194 = zext i8 %1193 to i64
  %1195 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 1
  %1196 = load i8, i8 addrspace(4)* %1195, align 1, !tbaa !12
  %1197 = zext i8 %1196 to i64
  %1198 = shl nuw nsw i64 %1197, 8
  %1199 = or i64 %1198, %1194
  %1200 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 2
  %1201 = load i8, i8 addrspace(4)* %1200, align 1, !tbaa !12
  %1202 = zext i8 %1201 to i64
  %1203 = shl nuw nsw i64 %1202, 16
  %1204 = or i64 %1199, %1203
  %1205 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 3
  %1206 = load i8, i8 addrspace(4)* %1205, align 1, !tbaa !12
  %1207 = zext i8 %1206 to i64
  %1208 = shl nuw nsw i64 %1207, 24
  %1209 = or i64 %1204, %1208
  %1210 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 4
  %1211 = load i8, i8 addrspace(4)* %1210, align 1, !tbaa !12
  %1212 = zext i8 %1211 to i64
  %1213 = shl nuw nsw i64 %1212, 32
  %1214 = or i64 %1209, %1213
  %1215 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 5
  %1216 = load i8, i8 addrspace(4)* %1215, align 1, !tbaa !12
  %1217 = zext i8 %1216 to i64
  %1218 = shl nuw nsw i64 %1217, 40
  %1219 = or i64 %1214, %1218
  %1220 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 6
  %1221 = load i8, i8 addrspace(4)* %1220, align 1, !tbaa !12
  %1222 = zext i8 %1221 to i64
  %1223 = shl nuw nsw i64 %1222, 48
  %1224 = or i64 %1219, %1223
  %1225 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 7
  %1226 = load i8, i8 addrspace(4)* %1225, align 1, !tbaa !12
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
  %1237 = load i8, i8 addrspace(4)* %1236, align 1, !tbaa !12
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
  %1253 = load i8, i8 addrspace(4)* %1246, align 1, !tbaa !12
  %1254 = zext i8 %1253 to i64
  %1255 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 1
  %1256 = load i8, i8 addrspace(4)* %1255, align 1, !tbaa !12
  %1257 = zext i8 %1256 to i64
  %1258 = shl nuw nsw i64 %1257, 8
  %1259 = or i64 %1258, %1254
  %1260 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 2
  %1261 = load i8, i8 addrspace(4)* %1260, align 1, !tbaa !12
  %1262 = zext i8 %1261 to i64
  %1263 = shl nuw nsw i64 %1262, 16
  %1264 = or i64 %1259, %1263
  %1265 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 3
  %1266 = load i8, i8 addrspace(4)* %1265, align 1, !tbaa !12
  %1267 = zext i8 %1266 to i64
  %1268 = shl nuw nsw i64 %1267, 24
  %1269 = or i64 %1264, %1268
  %1270 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 4
  %1271 = load i8, i8 addrspace(4)* %1270, align 1, !tbaa !12
  %1272 = zext i8 %1271 to i64
  %1273 = shl nuw nsw i64 %1272, 32
  %1274 = or i64 %1269, %1273
  %1275 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 5
  %1276 = load i8, i8 addrspace(4)* %1275, align 1, !tbaa !12
  %1277 = zext i8 %1276 to i64
  %1278 = shl nuw nsw i64 %1277, 40
  %1279 = or i64 %1274, %1278
  %1280 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 6
  %1281 = load i8, i8 addrspace(4)* %1280, align 1, !tbaa !12
  %1282 = zext i8 %1281 to i64
  %1283 = shl nuw nsw i64 %1282, 48
  %1284 = or i64 %1279, %1283
  %1285 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 7
  %1286 = load i8, i8 addrspace(4)* %1285, align 1, !tbaa !12
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
  %1297 = load i8, i8 addrspace(4)* %1296, align 1, !tbaa !12
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
  br i1 %1311, label %1365, label %1352

1312:                                             ; preds = %1305
  %1313 = load i8, i8 addrspace(4)* %1306, align 1, !tbaa !12
  %1314 = zext i8 %1313 to i64
  %1315 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 1
  %1316 = load i8, i8 addrspace(4)* %1315, align 1, !tbaa !12
  %1317 = zext i8 %1316 to i64
  %1318 = shl nuw nsw i64 %1317, 8
  %1319 = or i64 %1318, %1314
  %1320 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 2
  %1321 = load i8, i8 addrspace(4)* %1320, align 1, !tbaa !12
  %1322 = zext i8 %1321 to i64
  %1323 = shl nuw nsw i64 %1322, 16
  %1324 = or i64 %1319, %1323
  %1325 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 3
  %1326 = load i8, i8 addrspace(4)* %1325, align 1, !tbaa !12
  %1327 = zext i8 %1326 to i64
  %1328 = shl nuw nsw i64 %1327, 24
  %1329 = or i64 %1324, %1328
  %1330 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 4
  %1331 = load i8, i8 addrspace(4)* %1330, align 1, !tbaa !12
  %1332 = zext i8 %1331 to i64
  %1333 = shl nuw nsw i64 %1332, 32
  %1334 = or i64 %1329, %1333
  %1335 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 5
  %1336 = load i8, i8 addrspace(4)* %1335, align 1, !tbaa !12
  %1337 = zext i8 %1336 to i64
  %1338 = shl nuw nsw i64 %1337, 40
  %1339 = or i64 %1334, %1338
  %1340 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 6
  %1341 = load i8, i8 addrspace(4)* %1340, align 1, !tbaa !12
  %1342 = zext i8 %1341 to i64
  %1343 = shl nuw nsw i64 %1342, 48
  %1344 = or i64 %1339, %1343
  %1345 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 7
  %1346 = load i8, i8 addrspace(4)* %1345, align 1, !tbaa !12
  %1347 = zext i8 %1346 to i64
  %1348 = shl nuw i64 %1347, 56
  %1349 = or i64 %1344, %1348
  %1350 = add nsw i32 %1307, -8
  %1351 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 8
  br label %1365

1352:                                             ; preds = %1310, %1352
  %1353 = phi i32 [ %1363, %1352 ], [ 0, %1310 ]
  %1354 = phi i64 [ %1362, %1352 ], [ 0, %1310 ]
  %1355 = zext i32 %1353 to i64
  %1356 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 %1355
  %1357 = load i8, i8 addrspace(4)* %1356, align 1, !tbaa !12
  %1358 = zext i8 %1357 to i64
  %1359 = shl i32 %1353, 3
  %1360 = zext i32 %1359 to i64
  %1361 = shl nuw i64 %1358, %1360
  %1362 = or i64 %1361, %1354
  %1363 = add nuw nsw i32 %1353, 1
  %1364 = icmp eq i32 %1363, %1307
  br i1 %1364, label %1365, label %1352

1365:                                             ; preds = %1352, %1312, %1310
  %1366 = phi i8 addrspace(4)* [ %1351, %1312 ], [ %1306, %1310 ], [ %1306, %1352 ]
  %1367 = phi i32 [ %1350, %1312 ], [ 0, %1310 ], [ 0, %1352 ]
  %1368 = phi i64 [ %1349, %1312 ], [ 0, %1310 ], [ %1362, %1352 ]
  %1369 = icmp ugt i32 %1367, 7
  br i1 %1369, label %1372, label %1370

1370:                                             ; preds = %1365
  %1371 = icmp eq i32 %1367, 0
  br i1 %1371, label %1423, label %1410

1372:                                             ; preds = %1365
  %1373 = load i8, i8 addrspace(4)* %1366, align 1, !tbaa !12
  %1374 = zext i8 %1373 to i64
  %1375 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 1
  %1376 = load i8, i8 addrspace(4)* %1375, align 1, !tbaa !12
  %1377 = zext i8 %1376 to i64
  %1378 = shl nuw nsw i64 %1377, 8
  %1379 = or i64 %1378, %1374
  %1380 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 2
  %1381 = load i8, i8 addrspace(4)* %1380, align 1, !tbaa !12
  %1382 = zext i8 %1381 to i64
  %1383 = shl nuw nsw i64 %1382, 16
  %1384 = or i64 %1379, %1383
  %1385 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 3
  %1386 = load i8, i8 addrspace(4)* %1385, align 1, !tbaa !12
  %1387 = zext i8 %1386 to i64
  %1388 = shl nuw nsw i64 %1387, 24
  %1389 = or i64 %1384, %1388
  %1390 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 4
  %1391 = load i8, i8 addrspace(4)* %1390, align 1, !tbaa !12
  %1392 = zext i8 %1391 to i64
  %1393 = shl nuw nsw i64 %1392, 32
  %1394 = or i64 %1389, %1393
  %1395 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 5
  %1396 = load i8, i8 addrspace(4)* %1395, align 1, !tbaa !12
  %1397 = zext i8 %1396 to i64
  %1398 = shl nuw nsw i64 %1397, 40
  %1399 = or i64 %1394, %1398
  %1400 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 6
  %1401 = load i8, i8 addrspace(4)* %1400, align 1, !tbaa !12
  %1402 = zext i8 %1401 to i64
  %1403 = shl nuw nsw i64 %1402, 48
  %1404 = or i64 %1399, %1403
  %1405 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 7
  %1406 = load i8, i8 addrspace(4)* %1405, align 1, !tbaa !12
  %1407 = zext i8 %1406 to i64
  %1408 = shl nuw i64 %1407, 56
  %1409 = or i64 %1404, %1408
  br label %1423

1410:                                             ; preds = %1370, %1410
  %1411 = phi i32 [ %1421, %1410 ], [ 0, %1370 ]
  %1412 = phi i64 [ %1420, %1410 ], [ 0, %1370 ]
  %1413 = zext i32 %1411 to i64
  %1414 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 %1413
  %1415 = load i8, i8 addrspace(4)* %1414, align 1, !tbaa !12
  %1416 = zext i8 %1415 to i64
  %1417 = shl i32 %1411, 3
  %1418 = zext i32 %1417 to i64
  %1419 = shl nuw i64 %1416, %1418
  %1420 = or i64 %1419, %1412
  %1421 = add nuw nsw i32 %1411, 1
  %1422 = icmp eq i32 %1421, %1367
  br i1 %1422, label %1423, label %1410

1423:                                             ; preds = %1410, %1372, %1370
  %1424 = phi i64 [ %1409, %1372 ], [ 0, %1370 ], [ %1420, %1410 ]
  %1425 = shl nuw nsw i64 %1006, 2
  %1426 = add nuw nsw i64 %1425, 28
  %1427 = and i64 %1426, 480
  %1428 = and i64 %1008, -225
  %1429 = or i64 %1428, %1427
  %1430 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1429, i64 noundef %1068, i64 noundef %1128, i64 noundef %1188, i64 noundef %1248, i64 noundef %1308, i64 noundef %1368, i64 noundef %1424) #11
  %1431 = sub i64 %998, %1006
  %1432 = getelementptr inbounds i8, i8 addrspace(4)* %999, i64 %1006
  %1433 = icmp eq i64 %1431, 0
  br i1 %1433, label %1434, label %997

1434:                                             ; preds = %1423, %989
  %1435 = phi <2 x i64> [ %992, %989 ], [ %1430, %1423 ]
  %1436 = extractelement <2 x i64> %1435, i64 0
  %1437 = zext i32 %970 to i64
  %1438 = and i64 %1436, -225
  %1439 = or i64 %1438, 32
  %1440 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1439, i64 noundef %1437, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1441 = extractelement <2 x i64> %1440, i64 0
  %1442 = zext i32 %977 to i64
  %1443 = and i64 %1441, -225
  %1444 = or i64 %1443, 32
  %1445 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1444, i64 noundef %1442, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1446 = extractelement <2 x i64> %1445, i64 0
  %1447 = zext i32 %981 to i64
  %1448 = and i64 %1446, -225
  %1449 = or i64 %1448, 32
  %1450 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1449, i64 noundef %1447, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1451 = extractelement <2 x i64> %1450, i64 0
  %1452 = and i64 %1451, -225
  %1453 = or i64 %1452, 32
  %1454 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1453, i64 noundef %1437, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1455 = extractelement <2 x i64> %1454, i64 0
  %1456 = zext i32 %974 to i64
  %1457 = and i64 %1455, -225
  %1458 = or i64 %1457, 32
  %1459 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1458, i64 noundef %1456, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1460 = extractelement <2 x i64> %1459, i64 0
  %1461 = zext i32 %978 to i64
  %1462 = and i64 %1460, -227
  %1463 = or i64 %1462, 34
  %1464 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %986, i64 noundef %1463, i64 noundef %1461, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1465 = load i32, i32 addrspace(1)* %976, align 4, !tbaa !17
  %1466 = load i32, i32 addrspace(1)* %980, align 4, !tbaa !17
  store i32 %1466, i32 addrspace(1)* %976, align 4, !tbaa !17
  store i32 %1465, i32 addrspace(1)* %980, align 4, !tbaa !17
  store i8 1, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE11swappedeven, align 1, !tbaa !4
  br label %1467

1467:                                             ; preds = %972, %1434, %966
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  br label %1468

1468:                                             ; preds = %1467, %965
  fence syncscope("workgroup") acquire
  %1469 = load i8, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE10swappedodd, align 1, !tbaa !4, !range !19
  %1470 = icmp eq i8 %1469, 0
  %1471 = load i8, i8 addrspace(3)* @_ZZ11oddevensortPiS_iE11swappedeven, align 1
  %1472 = icmp eq i8 %1471, 0
  %1473 = select i1 %1470, i1 %1472, i1 false
  %1474 = xor i1 %15, true
  br i1 %1473, label %1475, label %14, !llvm.loop !20

1475:                                             ; preds = %1468
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1476 = icmp slt i32 %4, %2
  br i1 %1476, label %1477, label %1482

1477:                                             ; preds = %1475
  %1478 = zext i32 %4 to i64
  %1479 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1478
  %1480 = load i32, i32 addrspace(1)* %1479, align 4, !tbaa !17
  %1481 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %1478
  store i32 %1480, i32 addrspace(1)* %1481, align 4, !tbaa !17
  br label %1482

1482:                                             ; preds = %1477, %1475
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !22
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !24
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !8
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !8
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !8
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !8
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !8
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !8
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !8
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !8
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !24
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !26
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !24
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !24
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !8
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !8
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !27
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !30
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !8
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !31
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !30
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !24
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !8
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !8
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !8
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !8
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !8
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !8
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !8
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !8
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %110 = call i64 @llvm.read_register.i64(metadata !32) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !33
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !35
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !36
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !8
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !8
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !8
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !8
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !8
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !8
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !8
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !8
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !8
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !27
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !30
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !37
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !37
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !38
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !40
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !8
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !8
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !12
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !8
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !30
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !27
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !37
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !37
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !12
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
!4 = !{!5, !5, i64 0}
!5 = !{!"bool", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!10, !10, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{i16 1, i16 1025}
!16 = !{}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !6, i64 0}
!19 = !{i8 0, i8 2}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !10, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !10, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !23, i64 0}
!28 = !{!"", !23, i64 0, !23, i64 8, !29, i64 16, !9, i64 24, !9, i64 32, !9, i64 40}
!29 = !{!"hsa_signal_s", !9, i64 0}
!30 = !{!28, !9, i64 40}
!31 = !{!28, !23, i64 8}
!32 = !{!"exec"}
!33 = !{!34, !25, i64 16}
!34 = !{!"", !9, i64 0, !9, i64 8, !25, i64 16, !25, i64 20}
!35 = !{!34, !9, i64 8}
!36 = !{!34, !25, i64 20}
!37 = !{!34, !9, i64 0}
!38 = !{!39, !9, i64 16}
!39 = !{!"amd_signal_s", !9, i64 0, !10, i64 8, !9, i64 16, !25, i64 24, !25, i64 28, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 56}
!40 = !{!39, !25, i64 24}
