; ModuleID = '../data/hip_kernels/16858/0/main.cu'
source_filename = "../data/hip_kernels/16858/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [7 x i8] c"%0.3f\09\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [2 x i8] c"\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9print_matPfii(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = sub nsw i32 0, %11
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %14, label %1401

14:                                               ; preds = %3
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %18, label %16

16:                                               ; preds = %14
  %17 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  br label %34

18:                                               ; preds = %14
  %19 = icmp sgt i32 %2, 0
  %20 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 24
  %22 = bitcast i8 addrspace(4)* %21 to i64 addrspace(4)*
  br label %23

23:                                               ; preds = %18, %954
  %24 = phi i32 [ 0, %18 ], [ %955, %954 ]
  br i1 %19, label %29, label %25

25:                                               ; preds = %23
  %26 = load i64, i64 addrspace(4)* %22, align 8, !tbaa !7
  %27 = inttoptr i64 %26 to i8 addrspace(1)*
  %28 = addrspacecast i8 addrspace(1)* %27 to i8*
  br label %43

29:                                               ; preds = %23
  %30 = mul nsw i32 %24, %2
  %31 = load i64, i64 addrspace(4)* %22, align 8, !tbaa !7
  %32 = inttoptr i64 %31 to i8 addrspace(1)*
  %33 = addrspacecast i8 addrspace(1)* %32 to i8*
  br label %47

34:                                               ; preds = %954, %16
  %35 = phi i8 addrspace(4)* [ %17, %16 ], [ %20, %954 ]
  %36 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 24
  %37 = bitcast i8 addrspace(4)* %36 to i64 addrspace(4)*
  %38 = load i64, i64 addrspace(4)* %37, align 8, !tbaa !7
  %39 = inttoptr i64 %38 to i8 addrspace(1)*
  %40 = addrspacecast i8 addrspace(1)* %39 to i8*
  %41 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %42 = extractelement <2 x i64> %41, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %957, label %961

43:                                               ; preds = %501, %25
  %44 = phi i8* [ %28, %25 ], [ %33, %501 ]
  %45 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %46 = extractelement <2 x i64> %45, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %510, label %514

47:                                               ; preds = %29, %501
  %48 = phi i32 [ 0, %29 ], [ %508, %501 ]
  %49 = add nsw i32 %48, %30
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11
  %53 = fpext float %52 to double
  %54 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %55 = extractelement <2 x i64> %54, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %56, label %60

56:                                               ; preds = %47
  %57 = and i64 %55, -225
  %58 = or i64 %57, 32
  %59 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %58, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %501

60:                                               ; preds = %47
  %61 = and i64 %55, 2
  %62 = and i64 %55, -3
  %63 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %62, i64 0
  br label %64

64:                                               ; preds = %490, %60
  %65 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 6) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([7 x i8]* addrspacecast ([7 x i8] addrspace(4)* @.str to [7 x i8]*) to i64)), i64 1))), %60 ], [ %498, %490 ]
  %66 = phi i8 addrspace(4)* [ getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0), %60 ], [ %499, %490 ]
  %67 = phi <2 x i64> [ %63, %60 ], [ %497, %490 ]
  %68 = icmp ugt i64 %65, 56
  %69 = extractelement <2 x i64> %67, i64 0
  %70 = or i64 %69, %61
  %71 = insertelement <2 x i64> poison, i64 %70, i64 0
  %72 = select i1 %68, <2 x i64> %67, <2 x i64> %71
  %73 = tail call i64 @llvm.umin.i64(i64 %65, i64 56)
  %74 = trunc i64 %73 to i32
  %75 = extractelement <2 x i64> %72, i64 0
  %76 = icmp ugt i32 %74, 7
  br i1 %76, label %79, label %77

77:                                               ; preds = %64
  %78 = icmp eq i32 %74, 0
  br i1 %78, label %132, label %119

79:                                               ; preds = %64
  %80 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !15
  %81 = zext i8 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 1
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !15
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 8
  %86 = or i64 %85, %81
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 2
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !15
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 16
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 3
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !15
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 24
  %96 = or i64 %91, %95
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 4
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !15
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 32
  %101 = or i64 %96, %100
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 5
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !15
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 40
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 6
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !15
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 48
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 7
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !15
  %114 = zext i8 %113 to i64
  %115 = shl nuw i64 %114, 56
  %116 = or i64 %111, %115
  %117 = add nsw i32 %74, -8
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 8
  br label %132

119:                                              ; preds = %77, %119
  %120 = phi i32 [ %130, %119 ], [ 0, %77 ]
  %121 = phi i64 [ %129, %119 ], [ 0, %77 ]
  %122 = zext i32 %120 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 %122
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !15
  %125 = zext i8 %124 to i64
  %126 = shl i32 %120, 3
  %127 = zext i32 %126 to i64
  %128 = shl nuw i64 %125, %127
  %129 = or i64 %128, %121
  %130 = add nuw nsw i32 %120, 1
  %131 = icmp eq i32 %130, %74
  br i1 %131, label %132, label %119, !llvm.loop !16

132:                                              ; preds = %119, %79, %77
  %133 = phi i8 addrspace(4)* [ %118, %79 ], [ %66, %77 ], [ %66, %119 ]
  %134 = phi i32 [ %117, %79 ], [ 0, %77 ], [ 0, %119 ]
  %135 = phi i64 [ %116, %79 ], [ 0, %77 ], [ %129, %119 ]
  %136 = icmp ugt i32 %134, 7
  br i1 %136, label %139, label %137

137:                                              ; preds = %132
  %138 = icmp eq i32 %134, 0
  br i1 %138, label %192, label %179

139:                                              ; preds = %132
  %140 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !15
  %141 = zext i8 %140 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 1
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !15
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 8
  %146 = or i64 %145, %141
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 2
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !15
  %149 = zext i8 %148 to i64
  %150 = shl nuw nsw i64 %149, 16
  %151 = or i64 %146, %150
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 3
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !15
  %154 = zext i8 %153 to i64
  %155 = shl nuw nsw i64 %154, 24
  %156 = or i64 %151, %155
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 4
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !15
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 32
  %161 = or i64 %156, %160
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 5
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !15
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 40
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 6
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !15
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 48
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 7
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !15
  %174 = zext i8 %173 to i64
  %175 = shl nuw i64 %174, 56
  %176 = or i64 %171, %175
  %177 = add nsw i32 %134, -8
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 8
  br label %192

179:                                              ; preds = %137, %179
  %180 = phi i32 [ %190, %179 ], [ 0, %137 ]
  %181 = phi i64 [ %189, %179 ], [ 0, %137 ]
  %182 = zext i32 %180 to i64
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 %182
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !15
  %185 = zext i8 %184 to i64
  %186 = shl i32 %180, 3
  %187 = zext i32 %186 to i64
  %188 = shl nuw i64 %185, %187
  %189 = or i64 %188, %181
  %190 = add nuw nsw i32 %180, 1
  %191 = icmp eq i32 %190, %134
  br i1 %191, label %192, label %179

192:                                              ; preds = %179, %139, %137
  %193 = phi i8 addrspace(4)* [ %178, %139 ], [ %133, %137 ], [ %133, %179 ]
  %194 = phi i32 [ %177, %139 ], [ 0, %137 ], [ 0, %179 ]
  %195 = phi i64 [ %176, %139 ], [ 0, %137 ], [ %189, %179 ]
  %196 = icmp ugt i32 %194, 7
  br i1 %196, label %199, label %197

197:                                              ; preds = %192
  %198 = icmp eq i32 %194, 0
  br i1 %198, label %252, label %239

199:                                              ; preds = %192
  %200 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !15
  %201 = zext i8 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 1
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !15
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 8
  %206 = or i64 %205, %201
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 2
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !15
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 16
  %211 = or i64 %206, %210
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 3
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !15
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 24
  %216 = or i64 %211, %215
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 4
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !15
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 32
  %221 = or i64 %216, %220
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 5
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !15
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 40
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 6
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !15
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 48
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 7
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !15
  %234 = zext i8 %233 to i64
  %235 = shl nuw i64 %234, 56
  %236 = or i64 %231, %235
  %237 = add nsw i32 %194, -8
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 8
  br label %252

239:                                              ; preds = %197, %239
  %240 = phi i32 [ %250, %239 ], [ 0, %197 ]
  %241 = phi i64 [ %249, %239 ], [ 0, %197 ]
  %242 = zext i32 %240 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 %242
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !15
  %245 = zext i8 %244 to i64
  %246 = shl i32 %240, 3
  %247 = zext i32 %246 to i64
  %248 = shl nuw i64 %245, %247
  %249 = or i64 %248, %241
  %250 = add nuw nsw i32 %240, 1
  %251 = icmp eq i32 %250, %194
  br i1 %251, label %252, label %239

252:                                              ; preds = %239, %199, %197
  %253 = phi i8 addrspace(4)* [ %238, %199 ], [ %193, %197 ], [ %193, %239 ]
  %254 = phi i32 [ %237, %199 ], [ 0, %197 ], [ 0, %239 ]
  %255 = phi i64 [ %236, %199 ], [ 0, %197 ], [ %249, %239 ]
  %256 = icmp ugt i32 %254, 7
  br i1 %256, label %259, label %257

257:                                              ; preds = %252
  %258 = icmp eq i32 %254, 0
  br i1 %258, label %312, label %299

259:                                              ; preds = %252
  %260 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !15
  %261 = zext i8 %260 to i64
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 1
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !15
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 8
  %266 = or i64 %265, %261
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 2
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !15
  %269 = zext i8 %268 to i64
  %270 = shl nuw nsw i64 %269, 16
  %271 = or i64 %266, %270
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 3
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !15
  %274 = zext i8 %273 to i64
  %275 = shl nuw nsw i64 %274, 24
  %276 = or i64 %271, %275
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 4
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !15
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 32
  %281 = or i64 %276, %280
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 5
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !15
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 40
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 6
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !15
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 48
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 7
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !15
  %294 = zext i8 %293 to i64
  %295 = shl nuw i64 %294, 56
  %296 = or i64 %291, %295
  %297 = add nsw i32 %254, -8
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 8
  br label %312

299:                                              ; preds = %257, %299
  %300 = phi i32 [ %310, %299 ], [ 0, %257 ]
  %301 = phi i64 [ %309, %299 ], [ 0, %257 ]
  %302 = zext i32 %300 to i64
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 %302
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !15
  %305 = zext i8 %304 to i64
  %306 = shl i32 %300, 3
  %307 = zext i32 %306 to i64
  %308 = shl nuw i64 %305, %307
  %309 = or i64 %308, %301
  %310 = add nuw nsw i32 %300, 1
  %311 = icmp eq i32 %310, %254
  br i1 %311, label %312, label %299

312:                                              ; preds = %299, %259, %257
  %313 = phi i8 addrspace(4)* [ %298, %259 ], [ %253, %257 ], [ %253, %299 ]
  %314 = phi i32 [ %297, %259 ], [ 0, %257 ], [ 0, %299 ]
  %315 = phi i64 [ %296, %259 ], [ 0, %257 ], [ %309, %299 ]
  %316 = icmp ugt i32 %314, 7
  br i1 %316, label %319, label %317

317:                                              ; preds = %312
  %318 = icmp eq i32 %314, 0
  br i1 %318, label %372, label %359

319:                                              ; preds = %312
  %320 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !15
  %321 = zext i8 %320 to i64
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 1
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !15
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 8
  %326 = or i64 %325, %321
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 2
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !15
  %329 = zext i8 %328 to i64
  %330 = shl nuw nsw i64 %329, 16
  %331 = or i64 %326, %330
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 3
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !15
  %334 = zext i8 %333 to i64
  %335 = shl nuw nsw i64 %334, 24
  %336 = or i64 %331, %335
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 4
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !15
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 32
  %341 = or i64 %336, %340
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 5
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !15
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 40
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 6
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !15
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 48
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 7
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !15
  %354 = zext i8 %353 to i64
  %355 = shl nuw i64 %354, 56
  %356 = or i64 %351, %355
  %357 = add nsw i32 %314, -8
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 8
  br label %372

359:                                              ; preds = %317, %359
  %360 = phi i32 [ %370, %359 ], [ 0, %317 ]
  %361 = phi i64 [ %369, %359 ], [ 0, %317 ]
  %362 = zext i32 %360 to i64
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 %362
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !15
  %365 = zext i8 %364 to i64
  %366 = shl i32 %360, 3
  %367 = zext i32 %366 to i64
  %368 = shl nuw i64 %365, %367
  %369 = or i64 %368, %361
  %370 = add nuw nsw i32 %360, 1
  %371 = icmp eq i32 %370, %314
  br i1 %371, label %372, label %359

372:                                              ; preds = %359, %319, %317
  %373 = phi i8 addrspace(4)* [ %358, %319 ], [ %313, %317 ], [ %313, %359 ]
  %374 = phi i32 [ %357, %319 ], [ 0, %317 ], [ 0, %359 ]
  %375 = phi i64 [ %356, %319 ], [ 0, %317 ], [ %369, %359 ]
  %376 = icmp ugt i32 %374, 7
  br i1 %376, label %379, label %377

377:                                              ; preds = %372
  %378 = icmp eq i32 %374, 0
  br i1 %378, label %432, label %419

379:                                              ; preds = %372
  %380 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !15
  %381 = zext i8 %380 to i64
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 1
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !15
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 8
  %386 = or i64 %385, %381
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 2
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !15
  %389 = zext i8 %388 to i64
  %390 = shl nuw nsw i64 %389, 16
  %391 = or i64 %386, %390
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 3
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !15
  %394 = zext i8 %393 to i64
  %395 = shl nuw nsw i64 %394, 24
  %396 = or i64 %391, %395
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 4
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !15
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 32
  %401 = or i64 %396, %400
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 5
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !15
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 40
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 6
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !15
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 48
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 7
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !15
  %414 = zext i8 %413 to i64
  %415 = shl nuw i64 %414, 56
  %416 = or i64 %411, %415
  %417 = add nsw i32 %374, -8
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 8
  br label %432

419:                                              ; preds = %377, %419
  %420 = phi i32 [ %430, %419 ], [ 0, %377 ]
  %421 = phi i64 [ %429, %419 ], [ 0, %377 ]
  %422 = zext i32 %420 to i64
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 %422
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !15
  %425 = zext i8 %424 to i64
  %426 = shl i32 %420, 3
  %427 = zext i32 %426 to i64
  %428 = shl nuw i64 %425, %427
  %429 = or i64 %428, %421
  %430 = add nuw nsw i32 %420, 1
  %431 = icmp eq i32 %430, %374
  br i1 %431, label %432, label %419

432:                                              ; preds = %419, %379, %377
  %433 = phi i8 addrspace(4)* [ %418, %379 ], [ %373, %377 ], [ %373, %419 ]
  %434 = phi i32 [ %417, %379 ], [ 0, %377 ], [ 0, %419 ]
  %435 = phi i64 [ %416, %379 ], [ 0, %377 ], [ %429, %419 ]
  %436 = icmp ugt i32 %434, 7
  br i1 %436, label %439, label %437

437:                                              ; preds = %432
  %438 = icmp eq i32 %434, 0
  br i1 %438, label %490, label %477

439:                                              ; preds = %432
  %440 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !15
  %441 = zext i8 %440 to i64
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 1
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !15
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 8
  %446 = or i64 %445, %441
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 2
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !15
  %449 = zext i8 %448 to i64
  %450 = shl nuw nsw i64 %449, 16
  %451 = or i64 %446, %450
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 3
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !15
  %454 = zext i8 %453 to i64
  %455 = shl nuw nsw i64 %454, 24
  %456 = or i64 %451, %455
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 4
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !15
  %459 = zext i8 %458 to i64
  %460 = shl nuw nsw i64 %459, 32
  %461 = or i64 %456, %460
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 5
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !15
  %464 = zext i8 %463 to i64
  %465 = shl nuw nsw i64 %464, 40
  %466 = or i64 %461, %465
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 6
  %468 = load i8, i8 addrspace(4)* %467, align 1, !tbaa !15
  %469 = zext i8 %468 to i64
  %470 = shl nuw nsw i64 %469, 48
  %471 = or i64 %466, %470
  %472 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 7
  %473 = load i8, i8 addrspace(4)* %472, align 1, !tbaa !15
  %474 = zext i8 %473 to i64
  %475 = shl nuw i64 %474, 56
  %476 = or i64 %471, %475
  br label %490

477:                                              ; preds = %437, %477
  %478 = phi i32 [ %488, %477 ], [ 0, %437 ]
  %479 = phi i64 [ %487, %477 ], [ 0, %437 ]
  %480 = zext i32 %478 to i64
  %481 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 %480
  %482 = load i8, i8 addrspace(4)* %481, align 1, !tbaa !15
  %483 = zext i8 %482 to i64
  %484 = shl i32 %478, 3
  %485 = zext i32 %484 to i64
  %486 = shl nuw i64 %483, %485
  %487 = or i64 %486, %479
  %488 = add nuw nsw i32 %478, 1
  %489 = icmp eq i32 %488, %434
  br i1 %489, label %490, label %477

490:                                              ; preds = %477, %439, %437
  %491 = phi i64 [ %476, %439 ], [ 0, %437 ], [ %487, %477 ]
  %492 = shl nuw nsw i64 %73, 2
  %493 = add nuw nsw i64 %492, 28
  %494 = and i64 %493, 480
  %495 = and i64 %75, -225
  %496 = or i64 %495, %494
  %497 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %496, i64 noundef %135, i64 noundef %195, i64 noundef %255, i64 noundef %315, i64 noundef %375, i64 noundef %435, i64 noundef %491) #10
  %498 = sub i64 %65, %73
  %499 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 %73
  %500 = icmp eq i64 %498, 0
  br i1 %500, label %501, label %64

501:                                              ; preds = %490, %56
  %502 = phi <2 x i64> [ %59, %56 ], [ %497, %490 ]
  %503 = extractelement <2 x i64> %502, i64 0
  %504 = bitcast double %53 to i64
  %505 = and i64 %503, -227
  %506 = or i64 %505, 34
  %507 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %506, i64 noundef %504, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %508 = add nuw nsw i32 %48, 1
  %509 = icmp eq i32 %508, %2
  br i1 %509, label %43, label %47, !llvm.loop !18

510:                                              ; preds = %43
  %511 = and i64 %46, -227
  %512 = or i64 %511, 34
  %513 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %512, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %954

514:                                              ; preds = %43
  %515 = and i64 %46, -3
  %516 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %515, i64 0
  br label %517

517:                                              ; preds = %943, %514
  %518 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 1) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([2 x i8]* addrspacecast ([2 x i8] addrspace(4)* @.str.1 to [2 x i8]*) to i64)), i64 1))), %514 ], [ %951, %943 ]
  %519 = phi i8 addrspace(4)* [ getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %514 ], [ %952, %943 ]
  %520 = phi <2 x i64> [ %516, %514 ], [ %950, %943 ]
  %521 = icmp ugt i64 %518, 56
  %522 = extractelement <2 x i64> %520, i64 0
  %523 = or i64 %522, 2
  %524 = insertelement <2 x i64> poison, i64 %523, i64 0
  %525 = select i1 %521, <2 x i64> %520, <2 x i64> %524
  %526 = tail call i64 @llvm.umin.i64(i64 %518, i64 56)
  %527 = trunc i64 %526 to i32
  %528 = extractelement <2 x i64> %525, i64 0
  %529 = icmp ugt i32 %527, 7
  br i1 %529, label %532, label %530

530:                                              ; preds = %517
  %531 = icmp eq i32 %527, 0
  br i1 %531, label %585, label %572

532:                                              ; preds = %517
  %533 = load i8, i8 addrspace(4)* %519, align 1, !tbaa !15
  %534 = zext i8 %533 to i64
  %535 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 1
  %536 = load i8, i8 addrspace(4)* %535, align 1, !tbaa !15
  %537 = zext i8 %536 to i64
  %538 = shl nuw nsw i64 %537, 8
  %539 = or i64 %538, %534
  %540 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 2
  %541 = load i8, i8 addrspace(4)* %540, align 1, !tbaa !15
  %542 = zext i8 %541 to i64
  %543 = shl nuw nsw i64 %542, 16
  %544 = or i64 %539, %543
  %545 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 3
  %546 = load i8, i8 addrspace(4)* %545, align 1, !tbaa !15
  %547 = zext i8 %546 to i64
  %548 = shl nuw nsw i64 %547, 24
  %549 = or i64 %544, %548
  %550 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 4
  %551 = load i8, i8 addrspace(4)* %550, align 1, !tbaa !15
  %552 = zext i8 %551 to i64
  %553 = shl nuw nsw i64 %552, 32
  %554 = or i64 %549, %553
  %555 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 5
  %556 = load i8, i8 addrspace(4)* %555, align 1, !tbaa !15
  %557 = zext i8 %556 to i64
  %558 = shl nuw nsw i64 %557, 40
  %559 = or i64 %554, %558
  %560 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 6
  %561 = load i8, i8 addrspace(4)* %560, align 1, !tbaa !15
  %562 = zext i8 %561 to i64
  %563 = shl nuw nsw i64 %562, 48
  %564 = or i64 %559, %563
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 7
  %566 = load i8, i8 addrspace(4)* %565, align 1, !tbaa !15
  %567 = zext i8 %566 to i64
  %568 = shl nuw i64 %567, 56
  %569 = or i64 %564, %568
  %570 = add nsw i32 %527, -8
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 8
  br label %585

572:                                              ; preds = %530, %572
  %573 = phi i32 [ %583, %572 ], [ 0, %530 ]
  %574 = phi i64 [ %582, %572 ], [ 0, %530 ]
  %575 = zext i32 %573 to i64
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 %575
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !15
  %578 = zext i8 %577 to i64
  %579 = shl i32 %573, 3
  %580 = zext i32 %579 to i64
  %581 = shl nuw i64 %578, %580
  %582 = or i64 %581, %574
  %583 = add nuw nsw i32 %573, 1
  %584 = icmp eq i32 %583, %527
  br i1 %584, label %585, label %572, !llvm.loop !16

585:                                              ; preds = %572, %532, %530
  %586 = phi i8 addrspace(4)* [ %571, %532 ], [ %519, %530 ], [ %519, %572 ]
  %587 = phi i32 [ %570, %532 ], [ 0, %530 ], [ 0, %572 ]
  %588 = phi i64 [ %569, %532 ], [ 0, %530 ], [ %582, %572 ]
  %589 = icmp ugt i32 %587, 7
  br i1 %589, label %592, label %590

590:                                              ; preds = %585
  %591 = icmp eq i32 %587, 0
  br i1 %591, label %645, label %632

592:                                              ; preds = %585
  %593 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !15
  %594 = zext i8 %593 to i64
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 1
  %596 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !15
  %597 = zext i8 %596 to i64
  %598 = shl nuw nsw i64 %597, 8
  %599 = or i64 %598, %594
  %600 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 2
  %601 = load i8, i8 addrspace(4)* %600, align 1, !tbaa !15
  %602 = zext i8 %601 to i64
  %603 = shl nuw nsw i64 %602, 16
  %604 = or i64 %599, %603
  %605 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 3
  %606 = load i8, i8 addrspace(4)* %605, align 1, !tbaa !15
  %607 = zext i8 %606 to i64
  %608 = shl nuw nsw i64 %607, 24
  %609 = or i64 %604, %608
  %610 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 4
  %611 = load i8, i8 addrspace(4)* %610, align 1, !tbaa !15
  %612 = zext i8 %611 to i64
  %613 = shl nuw nsw i64 %612, 32
  %614 = or i64 %609, %613
  %615 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 5
  %616 = load i8, i8 addrspace(4)* %615, align 1, !tbaa !15
  %617 = zext i8 %616 to i64
  %618 = shl nuw nsw i64 %617, 40
  %619 = or i64 %614, %618
  %620 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 6
  %621 = load i8, i8 addrspace(4)* %620, align 1, !tbaa !15
  %622 = zext i8 %621 to i64
  %623 = shl nuw nsw i64 %622, 48
  %624 = or i64 %619, %623
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 7
  %626 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !15
  %627 = zext i8 %626 to i64
  %628 = shl nuw i64 %627, 56
  %629 = or i64 %624, %628
  %630 = add nsw i32 %587, -8
  %631 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 8
  br label %645

632:                                              ; preds = %590, %632
  %633 = phi i32 [ %643, %632 ], [ 0, %590 ]
  %634 = phi i64 [ %642, %632 ], [ 0, %590 ]
  %635 = zext i32 %633 to i64
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %586, i64 %635
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !15
  %638 = zext i8 %637 to i64
  %639 = shl i32 %633, 3
  %640 = zext i32 %639 to i64
  %641 = shl nuw i64 %638, %640
  %642 = or i64 %641, %634
  %643 = add nuw nsw i32 %633, 1
  %644 = icmp eq i32 %643, %587
  br i1 %644, label %645, label %632

645:                                              ; preds = %632, %592, %590
  %646 = phi i8 addrspace(4)* [ %631, %592 ], [ %586, %590 ], [ %586, %632 ]
  %647 = phi i32 [ %630, %592 ], [ 0, %590 ], [ 0, %632 ]
  %648 = phi i64 [ %629, %592 ], [ 0, %590 ], [ %642, %632 ]
  %649 = icmp ugt i32 %647, 7
  br i1 %649, label %652, label %650

650:                                              ; preds = %645
  %651 = icmp eq i32 %647, 0
  br i1 %651, label %705, label %692

652:                                              ; preds = %645
  %653 = load i8, i8 addrspace(4)* %646, align 1, !tbaa !15
  %654 = zext i8 %653 to i64
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 1
  %656 = load i8, i8 addrspace(4)* %655, align 1, !tbaa !15
  %657 = zext i8 %656 to i64
  %658 = shl nuw nsw i64 %657, 8
  %659 = or i64 %658, %654
  %660 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 2
  %661 = load i8, i8 addrspace(4)* %660, align 1, !tbaa !15
  %662 = zext i8 %661 to i64
  %663 = shl nuw nsw i64 %662, 16
  %664 = or i64 %659, %663
  %665 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 3
  %666 = load i8, i8 addrspace(4)* %665, align 1, !tbaa !15
  %667 = zext i8 %666 to i64
  %668 = shl nuw nsw i64 %667, 24
  %669 = or i64 %664, %668
  %670 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 4
  %671 = load i8, i8 addrspace(4)* %670, align 1, !tbaa !15
  %672 = zext i8 %671 to i64
  %673 = shl nuw nsw i64 %672, 32
  %674 = or i64 %669, %673
  %675 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 5
  %676 = load i8, i8 addrspace(4)* %675, align 1, !tbaa !15
  %677 = zext i8 %676 to i64
  %678 = shl nuw nsw i64 %677, 40
  %679 = or i64 %674, %678
  %680 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 6
  %681 = load i8, i8 addrspace(4)* %680, align 1, !tbaa !15
  %682 = zext i8 %681 to i64
  %683 = shl nuw nsw i64 %682, 48
  %684 = or i64 %679, %683
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 7
  %686 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !15
  %687 = zext i8 %686 to i64
  %688 = shl nuw i64 %687, 56
  %689 = or i64 %684, %688
  %690 = add nsw i32 %647, -8
  %691 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 8
  br label %705

692:                                              ; preds = %650, %692
  %693 = phi i32 [ %703, %692 ], [ 0, %650 ]
  %694 = phi i64 [ %702, %692 ], [ 0, %650 ]
  %695 = zext i32 %693 to i64
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %646, i64 %695
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !15
  %698 = zext i8 %697 to i64
  %699 = shl i32 %693, 3
  %700 = zext i32 %699 to i64
  %701 = shl nuw i64 %698, %700
  %702 = or i64 %701, %694
  %703 = add nuw nsw i32 %693, 1
  %704 = icmp eq i32 %703, %647
  br i1 %704, label %705, label %692

705:                                              ; preds = %692, %652, %650
  %706 = phi i8 addrspace(4)* [ %691, %652 ], [ %646, %650 ], [ %646, %692 ]
  %707 = phi i32 [ %690, %652 ], [ 0, %650 ], [ 0, %692 ]
  %708 = phi i64 [ %689, %652 ], [ 0, %650 ], [ %702, %692 ]
  %709 = icmp ugt i32 %707, 7
  br i1 %709, label %712, label %710

710:                                              ; preds = %705
  %711 = icmp eq i32 %707, 0
  br i1 %711, label %765, label %752

712:                                              ; preds = %705
  %713 = load i8, i8 addrspace(4)* %706, align 1, !tbaa !15
  %714 = zext i8 %713 to i64
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 1
  %716 = load i8, i8 addrspace(4)* %715, align 1, !tbaa !15
  %717 = zext i8 %716 to i64
  %718 = shl nuw nsw i64 %717, 8
  %719 = or i64 %718, %714
  %720 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 2
  %721 = load i8, i8 addrspace(4)* %720, align 1, !tbaa !15
  %722 = zext i8 %721 to i64
  %723 = shl nuw nsw i64 %722, 16
  %724 = or i64 %719, %723
  %725 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 3
  %726 = load i8, i8 addrspace(4)* %725, align 1, !tbaa !15
  %727 = zext i8 %726 to i64
  %728 = shl nuw nsw i64 %727, 24
  %729 = or i64 %724, %728
  %730 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 4
  %731 = load i8, i8 addrspace(4)* %730, align 1, !tbaa !15
  %732 = zext i8 %731 to i64
  %733 = shl nuw nsw i64 %732, 32
  %734 = or i64 %729, %733
  %735 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 5
  %736 = load i8, i8 addrspace(4)* %735, align 1, !tbaa !15
  %737 = zext i8 %736 to i64
  %738 = shl nuw nsw i64 %737, 40
  %739 = or i64 %734, %738
  %740 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 6
  %741 = load i8, i8 addrspace(4)* %740, align 1, !tbaa !15
  %742 = zext i8 %741 to i64
  %743 = shl nuw nsw i64 %742, 48
  %744 = or i64 %739, %743
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 7
  %746 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !15
  %747 = zext i8 %746 to i64
  %748 = shl nuw i64 %747, 56
  %749 = or i64 %744, %748
  %750 = add nsw i32 %707, -8
  %751 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 8
  br label %765

752:                                              ; preds = %710, %752
  %753 = phi i32 [ %763, %752 ], [ 0, %710 ]
  %754 = phi i64 [ %762, %752 ], [ 0, %710 ]
  %755 = zext i32 %753 to i64
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %706, i64 %755
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !15
  %758 = zext i8 %757 to i64
  %759 = shl i32 %753, 3
  %760 = zext i32 %759 to i64
  %761 = shl nuw i64 %758, %760
  %762 = or i64 %761, %754
  %763 = add nuw nsw i32 %753, 1
  %764 = icmp eq i32 %763, %707
  br i1 %764, label %765, label %752

765:                                              ; preds = %752, %712, %710
  %766 = phi i8 addrspace(4)* [ %751, %712 ], [ %706, %710 ], [ %706, %752 ]
  %767 = phi i32 [ %750, %712 ], [ 0, %710 ], [ 0, %752 ]
  %768 = phi i64 [ %749, %712 ], [ 0, %710 ], [ %762, %752 ]
  %769 = icmp ugt i32 %767, 7
  br i1 %769, label %772, label %770

770:                                              ; preds = %765
  %771 = icmp eq i32 %767, 0
  br i1 %771, label %825, label %812

772:                                              ; preds = %765
  %773 = load i8, i8 addrspace(4)* %766, align 1, !tbaa !15
  %774 = zext i8 %773 to i64
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 1
  %776 = load i8, i8 addrspace(4)* %775, align 1, !tbaa !15
  %777 = zext i8 %776 to i64
  %778 = shl nuw nsw i64 %777, 8
  %779 = or i64 %778, %774
  %780 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 2
  %781 = load i8, i8 addrspace(4)* %780, align 1, !tbaa !15
  %782 = zext i8 %781 to i64
  %783 = shl nuw nsw i64 %782, 16
  %784 = or i64 %779, %783
  %785 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 3
  %786 = load i8, i8 addrspace(4)* %785, align 1, !tbaa !15
  %787 = zext i8 %786 to i64
  %788 = shl nuw nsw i64 %787, 24
  %789 = or i64 %784, %788
  %790 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 4
  %791 = load i8, i8 addrspace(4)* %790, align 1, !tbaa !15
  %792 = zext i8 %791 to i64
  %793 = shl nuw nsw i64 %792, 32
  %794 = or i64 %789, %793
  %795 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 5
  %796 = load i8, i8 addrspace(4)* %795, align 1, !tbaa !15
  %797 = zext i8 %796 to i64
  %798 = shl nuw nsw i64 %797, 40
  %799 = or i64 %794, %798
  %800 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 6
  %801 = load i8, i8 addrspace(4)* %800, align 1, !tbaa !15
  %802 = zext i8 %801 to i64
  %803 = shl nuw nsw i64 %802, 48
  %804 = or i64 %799, %803
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 7
  %806 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !15
  %807 = zext i8 %806 to i64
  %808 = shl nuw i64 %807, 56
  %809 = or i64 %804, %808
  %810 = add nsw i32 %767, -8
  %811 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 8
  br label %825

812:                                              ; preds = %770, %812
  %813 = phi i32 [ %823, %812 ], [ 0, %770 ]
  %814 = phi i64 [ %822, %812 ], [ 0, %770 ]
  %815 = zext i32 %813 to i64
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %766, i64 %815
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !15
  %818 = zext i8 %817 to i64
  %819 = shl i32 %813, 3
  %820 = zext i32 %819 to i64
  %821 = shl nuw i64 %818, %820
  %822 = or i64 %821, %814
  %823 = add nuw nsw i32 %813, 1
  %824 = icmp eq i32 %823, %767
  br i1 %824, label %825, label %812

825:                                              ; preds = %812, %772, %770
  %826 = phi i8 addrspace(4)* [ %811, %772 ], [ %766, %770 ], [ %766, %812 ]
  %827 = phi i32 [ %810, %772 ], [ 0, %770 ], [ 0, %812 ]
  %828 = phi i64 [ %809, %772 ], [ 0, %770 ], [ %822, %812 ]
  %829 = icmp ugt i32 %827, 7
  br i1 %829, label %832, label %830

830:                                              ; preds = %825
  %831 = icmp eq i32 %827, 0
  br i1 %831, label %885, label %872

832:                                              ; preds = %825
  %833 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !15
  %834 = zext i8 %833 to i64
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 1
  %836 = load i8, i8 addrspace(4)* %835, align 1, !tbaa !15
  %837 = zext i8 %836 to i64
  %838 = shl nuw nsw i64 %837, 8
  %839 = or i64 %838, %834
  %840 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 2
  %841 = load i8, i8 addrspace(4)* %840, align 1, !tbaa !15
  %842 = zext i8 %841 to i64
  %843 = shl nuw nsw i64 %842, 16
  %844 = or i64 %839, %843
  %845 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 3
  %846 = load i8, i8 addrspace(4)* %845, align 1, !tbaa !15
  %847 = zext i8 %846 to i64
  %848 = shl nuw nsw i64 %847, 24
  %849 = or i64 %844, %848
  %850 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 4
  %851 = load i8, i8 addrspace(4)* %850, align 1, !tbaa !15
  %852 = zext i8 %851 to i64
  %853 = shl nuw nsw i64 %852, 32
  %854 = or i64 %849, %853
  %855 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 5
  %856 = load i8, i8 addrspace(4)* %855, align 1, !tbaa !15
  %857 = zext i8 %856 to i64
  %858 = shl nuw nsw i64 %857, 40
  %859 = or i64 %854, %858
  %860 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 6
  %861 = load i8, i8 addrspace(4)* %860, align 1, !tbaa !15
  %862 = zext i8 %861 to i64
  %863 = shl nuw nsw i64 %862, 48
  %864 = or i64 %859, %863
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 7
  %866 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !15
  %867 = zext i8 %866 to i64
  %868 = shl nuw i64 %867, 56
  %869 = or i64 %864, %868
  %870 = add nsw i32 %827, -8
  %871 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 8
  br label %885

872:                                              ; preds = %830, %872
  %873 = phi i32 [ %883, %872 ], [ 0, %830 ]
  %874 = phi i64 [ %882, %872 ], [ 0, %830 ]
  %875 = zext i32 %873 to i64
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %826, i64 %875
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !15
  %878 = zext i8 %877 to i64
  %879 = shl i32 %873, 3
  %880 = zext i32 %879 to i64
  %881 = shl nuw i64 %878, %880
  %882 = or i64 %881, %874
  %883 = add nuw nsw i32 %873, 1
  %884 = icmp eq i32 %883, %827
  br i1 %884, label %885, label %872

885:                                              ; preds = %872, %832, %830
  %886 = phi i8 addrspace(4)* [ %871, %832 ], [ %826, %830 ], [ %826, %872 ]
  %887 = phi i32 [ %870, %832 ], [ 0, %830 ], [ 0, %872 ]
  %888 = phi i64 [ %869, %832 ], [ 0, %830 ], [ %882, %872 ]
  %889 = icmp ugt i32 %887, 7
  br i1 %889, label %892, label %890

890:                                              ; preds = %885
  %891 = icmp eq i32 %887, 0
  br i1 %891, label %943, label %930

892:                                              ; preds = %885
  %893 = load i8, i8 addrspace(4)* %886, align 1, !tbaa !15
  %894 = zext i8 %893 to i64
  %895 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 1
  %896 = load i8, i8 addrspace(4)* %895, align 1, !tbaa !15
  %897 = zext i8 %896 to i64
  %898 = shl nuw nsw i64 %897, 8
  %899 = or i64 %898, %894
  %900 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 2
  %901 = load i8, i8 addrspace(4)* %900, align 1, !tbaa !15
  %902 = zext i8 %901 to i64
  %903 = shl nuw nsw i64 %902, 16
  %904 = or i64 %899, %903
  %905 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 3
  %906 = load i8, i8 addrspace(4)* %905, align 1, !tbaa !15
  %907 = zext i8 %906 to i64
  %908 = shl nuw nsw i64 %907, 24
  %909 = or i64 %904, %908
  %910 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 4
  %911 = load i8, i8 addrspace(4)* %910, align 1, !tbaa !15
  %912 = zext i8 %911 to i64
  %913 = shl nuw nsw i64 %912, 32
  %914 = or i64 %909, %913
  %915 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 5
  %916 = load i8, i8 addrspace(4)* %915, align 1, !tbaa !15
  %917 = zext i8 %916 to i64
  %918 = shl nuw nsw i64 %917, 40
  %919 = or i64 %914, %918
  %920 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 6
  %921 = load i8, i8 addrspace(4)* %920, align 1, !tbaa !15
  %922 = zext i8 %921 to i64
  %923 = shl nuw nsw i64 %922, 48
  %924 = or i64 %919, %923
  %925 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 7
  %926 = load i8, i8 addrspace(4)* %925, align 1, !tbaa !15
  %927 = zext i8 %926 to i64
  %928 = shl nuw i64 %927, 56
  %929 = or i64 %924, %928
  br label %943

930:                                              ; preds = %890, %930
  %931 = phi i32 [ %941, %930 ], [ 0, %890 ]
  %932 = phi i64 [ %940, %930 ], [ 0, %890 ]
  %933 = zext i32 %931 to i64
  %934 = getelementptr inbounds i8, i8 addrspace(4)* %886, i64 %933
  %935 = load i8, i8 addrspace(4)* %934, align 1, !tbaa !15
  %936 = zext i8 %935 to i64
  %937 = shl i32 %931, 3
  %938 = zext i32 %937 to i64
  %939 = shl nuw i64 %936, %938
  %940 = or i64 %939, %932
  %941 = add nuw nsw i32 %931, 1
  %942 = icmp eq i32 %941, %887
  br i1 %942, label %943, label %930

943:                                              ; preds = %930, %892, %890
  %944 = phi i64 [ %929, %892 ], [ 0, %890 ], [ %940, %930 ]
  %945 = shl nuw nsw i64 %526, 2
  %946 = add nuw nsw i64 %945, 28
  %947 = and i64 %946, 480
  %948 = and i64 %528, -225
  %949 = or i64 %948, %947
  %950 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %949, i64 noundef %588, i64 noundef %648, i64 noundef %708, i64 noundef %768, i64 noundef %828, i64 noundef %888, i64 noundef %944) #10
  %951 = sub i64 %518, %526
  %952 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 %526
  %953 = icmp eq i64 %951, 0
  br i1 %953, label %954, label %517

954:                                              ; preds = %943, %510
  %955 = add nuw nsw i32 %24, 1
  %956 = icmp eq i32 %955, %1
  br i1 %956, label %34, label %23, !llvm.loop !20

957:                                              ; preds = %34
  %958 = and i64 %42, -227
  %959 = or i64 %958, 34
  %960 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef %959, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1401

961:                                              ; preds = %34
  %962 = and i64 %42, -3
  %963 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %962, i64 0
  br label %964

964:                                              ; preds = %1390, %961
  %965 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 1) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([2 x i8]* addrspacecast ([2 x i8] addrspace(4)* @.str.1 to [2 x i8]*) to i64)), i64 1))), %961 ], [ %1398, %1390 ]
  %966 = phi i8 addrspace(4)* [ getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %961 ], [ %1399, %1390 ]
  %967 = phi <2 x i64> [ %963, %961 ], [ %1397, %1390 ]
  %968 = icmp ugt i64 %965, 56
  %969 = extractelement <2 x i64> %967, i64 0
  %970 = or i64 %969, 2
  %971 = insertelement <2 x i64> poison, i64 %970, i64 0
  %972 = select i1 %968, <2 x i64> %967, <2 x i64> %971
  %973 = tail call i64 @llvm.umin.i64(i64 %965, i64 56)
  %974 = trunc i64 %973 to i32
  %975 = extractelement <2 x i64> %972, i64 0
  %976 = icmp ugt i32 %974, 7
  br i1 %976, label %979, label %977

977:                                              ; preds = %964
  %978 = icmp eq i32 %974, 0
  br i1 %978, label %1032, label %1019

979:                                              ; preds = %964
  %980 = load i8, i8 addrspace(4)* %966, align 1, !tbaa !15
  %981 = zext i8 %980 to i64
  %982 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 1
  %983 = load i8, i8 addrspace(4)* %982, align 1, !tbaa !15
  %984 = zext i8 %983 to i64
  %985 = shl nuw nsw i64 %984, 8
  %986 = or i64 %985, %981
  %987 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 2
  %988 = load i8, i8 addrspace(4)* %987, align 1, !tbaa !15
  %989 = zext i8 %988 to i64
  %990 = shl nuw nsw i64 %989, 16
  %991 = or i64 %986, %990
  %992 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 3
  %993 = load i8, i8 addrspace(4)* %992, align 1, !tbaa !15
  %994 = zext i8 %993 to i64
  %995 = shl nuw nsw i64 %994, 24
  %996 = or i64 %991, %995
  %997 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 4
  %998 = load i8, i8 addrspace(4)* %997, align 1, !tbaa !15
  %999 = zext i8 %998 to i64
  %1000 = shl nuw nsw i64 %999, 32
  %1001 = or i64 %996, %1000
  %1002 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 5
  %1003 = load i8, i8 addrspace(4)* %1002, align 1, !tbaa !15
  %1004 = zext i8 %1003 to i64
  %1005 = shl nuw nsw i64 %1004, 40
  %1006 = or i64 %1001, %1005
  %1007 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 6
  %1008 = load i8, i8 addrspace(4)* %1007, align 1, !tbaa !15
  %1009 = zext i8 %1008 to i64
  %1010 = shl nuw nsw i64 %1009, 48
  %1011 = or i64 %1006, %1010
  %1012 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 7
  %1013 = load i8, i8 addrspace(4)* %1012, align 1, !tbaa !15
  %1014 = zext i8 %1013 to i64
  %1015 = shl nuw i64 %1014, 56
  %1016 = or i64 %1011, %1015
  %1017 = add nsw i32 %974, -8
  %1018 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 8
  br label %1032

1019:                                             ; preds = %977, %1019
  %1020 = phi i32 [ %1030, %1019 ], [ 0, %977 ]
  %1021 = phi i64 [ %1029, %1019 ], [ 0, %977 ]
  %1022 = zext i32 %1020 to i64
  %1023 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 %1022
  %1024 = load i8, i8 addrspace(4)* %1023, align 1, !tbaa !15
  %1025 = zext i8 %1024 to i64
  %1026 = shl i32 %1020, 3
  %1027 = zext i32 %1026 to i64
  %1028 = shl nuw i64 %1025, %1027
  %1029 = or i64 %1028, %1021
  %1030 = add nuw nsw i32 %1020, 1
  %1031 = icmp eq i32 %1030, %974
  br i1 %1031, label %1032, label %1019, !llvm.loop !16

1032:                                             ; preds = %1019, %979, %977
  %1033 = phi i8 addrspace(4)* [ %1018, %979 ], [ %966, %977 ], [ %966, %1019 ]
  %1034 = phi i32 [ %1017, %979 ], [ 0, %977 ], [ 0, %1019 ]
  %1035 = phi i64 [ %1016, %979 ], [ 0, %977 ], [ %1029, %1019 ]
  %1036 = icmp ugt i32 %1034, 7
  br i1 %1036, label %1039, label %1037

1037:                                             ; preds = %1032
  %1038 = icmp eq i32 %1034, 0
  br i1 %1038, label %1092, label %1079

1039:                                             ; preds = %1032
  %1040 = load i8, i8 addrspace(4)* %1033, align 1, !tbaa !15
  %1041 = zext i8 %1040 to i64
  %1042 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 1
  %1043 = load i8, i8 addrspace(4)* %1042, align 1, !tbaa !15
  %1044 = zext i8 %1043 to i64
  %1045 = shl nuw nsw i64 %1044, 8
  %1046 = or i64 %1045, %1041
  %1047 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 2
  %1048 = load i8, i8 addrspace(4)* %1047, align 1, !tbaa !15
  %1049 = zext i8 %1048 to i64
  %1050 = shl nuw nsw i64 %1049, 16
  %1051 = or i64 %1046, %1050
  %1052 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 3
  %1053 = load i8, i8 addrspace(4)* %1052, align 1, !tbaa !15
  %1054 = zext i8 %1053 to i64
  %1055 = shl nuw nsw i64 %1054, 24
  %1056 = or i64 %1051, %1055
  %1057 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 4
  %1058 = load i8, i8 addrspace(4)* %1057, align 1, !tbaa !15
  %1059 = zext i8 %1058 to i64
  %1060 = shl nuw nsw i64 %1059, 32
  %1061 = or i64 %1056, %1060
  %1062 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 5
  %1063 = load i8, i8 addrspace(4)* %1062, align 1, !tbaa !15
  %1064 = zext i8 %1063 to i64
  %1065 = shl nuw nsw i64 %1064, 40
  %1066 = or i64 %1061, %1065
  %1067 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 6
  %1068 = load i8, i8 addrspace(4)* %1067, align 1, !tbaa !15
  %1069 = zext i8 %1068 to i64
  %1070 = shl nuw nsw i64 %1069, 48
  %1071 = or i64 %1066, %1070
  %1072 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 7
  %1073 = load i8, i8 addrspace(4)* %1072, align 1, !tbaa !15
  %1074 = zext i8 %1073 to i64
  %1075 = shl nuw i64 %1074, 56
  %1076 = or i64 %1071, %1075
  %1077 = add nsw i32 %1034, -8
  %1078 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 8
  br label %1092

1079:                                             ; preds = %1037, %1079
  %1080 = phi i32 [ %1090, %1079 ], [ 0, %1037 ]
  %1081 = phi i64 [ %1089, %1079 ], [ 0, %1037 ]
  %1082 = zext i32 %1080 to i64
  %1083 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 %1082
  %1084 = load i8, i8 addrspace(4)* %1083, align 1, !tbaa !15
  %1085 = zext i8 %1084 to i64
  %1086 = shl i32 %1080, 3
  %1087 = zext i32 %1086 to i64
  %1088 = shl nuw i64 %1085, %1087
  %1089 = or i64 %1088, %1081
  %1090 = add nuw nsw i32 %1080, 1
  %1091 = icmp eq i32 %1090, %1034
  br i1 %1091, label %1092, label %1079

1092:                                             ; preds = %1079, %1039, %1037
  %1093 = phi i8 addrspace(4)* [ %1078, %1039 ], [ %1033, %1037 ], [ %1033, %1079 ]
  %1094 = phi i32 [ %1077, %1039 ], [ 0, %1037 ], [ 0, %1079 ]
  %1095 = phi i64 [ %1076, %1039 ], [ 0, %1037 ], [ %1089, %1079 ]
  %1096 = icmp ugt i32 %1094, 7
  br i1 %1096, label %1099, label %1097

1097:                                             ; preds = %1092
  %1098 = icmp eq i32 %1094, 0
  br i1 %1098, label %1152, label %1139

1099:                                             ; preds = %1092
  %1100 = load i8, i8 addrspace(4)* %1093, align 1, !tbaa !15
  %1101 = zext i8 %1100 to i64
  %1102 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 1
  %1103 = load i8, i8 addrspace(4)* %1102, align 1, !tbaa !15
  %1104 = zext i8 %1103 to i64
  %1105 = shl nuw nsw i64 %1104, 8
  %1106 = or i64 %1105, %1101
  %1107 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 2
  %1108 = load i8, i8 addrspace(4)* %1107, align 1, !tbaa !15
  %1109 = zext i8 %1108 to i64
  %1110 = shl nuw nsw i64 %1109, 16
  %1111 = or i64 %1106, %1110
  %1112 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 3
  %1113 = load i8, i8 addrspace(4)* %1112, align 1, !tbaa !15
  %1114 = zext i8 %1113 to i64
  %1115 = shl nuw nsw i64 %1114, 24
  %1116 = or i64 %1111, %1115
  %1117 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 4
  %1118 = load i8, i8 addrspace(4)* %1117, align 1, !tbaa !15
  %1119 = zext i8 %1118 to i64
  %1120 = shl nuw nsw i64 %1119, 32
  %1121 = or i64 %1116, %1120
  %1122 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 5
  %1123 = load i8, i8 addrspace(4)* %1122, align 1, !tbaa !15
  %1124 = zext i8 %1123 to i64
  %1125 = shl nuw nsw i64 %1124, 40
  %1126 = or i64 %1121, %1125
  %1127 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 6
  %1128 = load i8, i8 addrspace(4)* %1127, align 1, !tbaa !15
  %1129 = zext i8 %1128 to i64
  %1130 = shl nuw nsw i64 %1129, 48
  %1131 = or i64 %1126, %1130
  %1132 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 7
  %1133 = load i8, i8 addrspace(4)* %1132, align 1, !tbaa !15
  %1134 = zext i8 %1133 to i64
  %1135 = shl nuw i64 %1134, 56
  %1136 = or i64 %1131, %1135
  %1137 = add nsw i32 %1094, -8
  %1138 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 8
  br label %1152

1139:                                             ; preds = %1097, %1139
  %1140 = phi i32 [ %1150, %1139 ], [ 0, %1097 ]
  %1141 = phi i64 [ %1149, %1139 ], [ 0, %1097 ]
  %1142 = zext i32 %1140 to i64
  %1143 = getelementptr inbounds i8, i8 addrspace(4)* %1093, i64 %1142
  %1144 = load i8, i8 addrspace(4)* %1143, align 1, !tbaa !15
  %1145 = zext i8 %1144 to i64
  %1146 = shl i32 %1140, 3
  %1147 = zext i32 %1146 to i64
  %1148 = shl nuw i64 %1145, %1147
  %1149 = or i64 %1148, %1141
  %1150 = add nuw nsw i32 %1140, 1
  %1151 = icmp eq i32 %1150, %1094
  br i1 %1151, label %1152, label %1139

1152:                                             ; preds = %1139, %1099, %1097
  %1153 = phi i8 addrspace(4)* [ %1138, %1099 ], [ %1093, %1097 ], [ %1093, %1139 ]
  %1154 = phi i32 [ %1137, %1099 ], [ 0, %1097 ], [ 0, %1139 ]
  %1155 = phi i64 [ %1136, %1099 ], [ 0, %1097 ], [ %1149, %1139 ]
  %1156 = icmp ugt i32 %1154, 7
  br i1 %1156, label %1159, label %1157

1157:                                             ; preds = %1152
  %1158 = icmp eq i32 %1154, 0
  br i1 %1158, label %1212, label %1199

1159:                                             ; preds = %1152
  %1160 = load i8, i8 addrspace(4)* %1153, align 1, !tbaa !15
  %1161 = zext i8 %1160 to i64
  %1162 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 1
  %1163 = load i8, i8 addrspace(4)* %1162, align 1, !tbaa !15
  %1164 = zext i8 %1163 to i64
  %1165 = shl nuw nsw i64 %1164, 8
  %1166 = or i64 %1165, %1161
  %1167 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 2
  %1168 = load i8, i8 addrspace(4)* %1167, align 1, !tbaa !15
  %1169 = zext i8 %1168 to i64
  %1170 = shl nuw nsw i64 %1169, 16
  %1171 = or i64 %1166, %1170
  %1172 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 3
  %1173 = load i8, i8 addrspace(4)* %1172, align 1, !tbaa !15
  %1174 = zext i8 %1173 to i64
  %1175 = shl nuw nsw i64 %1174, 24
  %1176 = or i64 %1171, %1175
  %1177 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 4
  %1178 = load i8, i8 addrspace(4)* %1177, align 1, !tbaa !15
  %1179 = zext i8 %1178 to i64
  %1180 = shl nuw nsw i64 %1179, 32
  %1181 = or i64 %1176, %1180
  %1182 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 5
  %1183 = load i8, i8 addrspace(4)* %1182, align 1, !tbaa !15
  %1184 = zext i8 %1183 to i64
  %1185 = shl nuw nsw i64 %1184, 40
  %1186 = or i64 %1181, %1185
  %1187 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 6
  %1188 = load i8, i8 addrspace(4)* %1187, align 1, !tbaa !15
  %1189 = zext i8 %1188 to i64
  %1190 = shl nuw nsw i64 %1189, 48
  %1191 = or i64 %1186, %1190
  %1192 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 7
  %1193 = load i8, i8 addrspace(4)* %1192, align 1, !tbaa !15
  %1194 = zext i8 %1193 to i64
  %1195 = shl nuw i64 %1194, 56
  %1196 = or i64 %1191, %1195
  %1197 = add nsw i32 %1154, -8
  %1198 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 8
  br label %1212

1199:                                             ; preds = %1157, %1199
  %1200 = phi i32 [ %1210, %1199 ], [ 0, %1157 ]
  %1201 = phi i64 [ %1209, %1199 ], [ 0, %1157 ]
  %1202 = zext i32 %1200 to i64
  %1203 = getelementptr inbounds i8, i8 addrspace(4)* %1153, i64 %1202
  %1204 = load i8, i8 addrspace(4)* %1203, align 1, !tbaa !15
  %1205 = zext i8 %1204 to i64
  %1206 = shl i32 %1200, 3
  %1207 = zext i32 %1206 to i64
  %1208 = shl nuw i64 %1205, %1207
  %1209 = or i64 %1208, %1201
  %1210 = add nuw nsw i32 %1200, 1
  %1211 = icmp eq i32 %1210, %1154
  br i1 %1211, label %1212, label %1199

1212:                                             ; preds = %1199, %1159, %1157
  %1213 = phi i8 addrspace(4)* [ %1198, %1159 ], [ %1153, %1157 ], [ %1153, %1199 ]
  %1214 = phi i32 [ %1197, %1159 ], [ 0, %1157 ], [ 0, %1199 ]
  %1215 = phi i64 [ %1196, %1159 ], [ 0, %1157 ], [ %1209, %1199 ]
  %1216 = icmp ugt i32 %1214, 7
  br i1 %1216, label %1219, label %1217

1217:                                             ; preds = %1212
  %1218 = icmp eq i32 %1214, 0
  br i1 %1218, label %1272, label %1259

1219:                                             ; preds = %1212
  %1220 = load i8, i8 addrspace(4)* %1213, align 1, !tbaa !15
  %1221 = zext i8 %1220 to i64
  %1222 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 1
  %1223 = load i8, i8 addrspace(4)* %1222, align 1, !tbaa !15
  %1224 = zext i8 %1223 to i64
  %1225 = shl nuw nsw i64 %1224, 8
  %1226 = or i64 %1225, %1221
  %1227 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 2
  %1228 = load i8, i8 addrspace(4)* %1227, align 1, !tbaa !15
  %1229 = zext i8 %1228 to i64
  %1230 = shl nuw nsw i64 %1229, 16
  %1231 = or i64 %1226, %1230
  %1232 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 3
  %1233 = load i8, i8 addrspace(4)* %1232, align 1, !tbaa !15
  %1234 = zext i8 %1233 to i64
  %1235 = shl nuw nsw i64 %1234, 24
  %1236 = or i64 %1231, %1235
  %1237 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 4
  %1238 = load i8, i8 addrspace(4)* %1237, align 1, !tbaa !15
  %1239 = zext i8 %1238 to i64
  %1240 = shl nuw nsw i64 %1239, 32
  %1241 = or i64 %1236, %1240
  %1242 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 5
  %1243 = load i8, i8 addrspace(4)* %1242, align 1, !tbaa !15
  %1244 = zext i8 %1243 to i64
  %1245 = shl nuw nsw i64 %1244, 40
  %1246 = or i64 %1241, %1245
  %1247 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 6
  %1248 = load i8, i8 addrspace(4)* %1247, align 1, !tbaa !15
  %1249 = zext i8 %1248 to i64
  %1250 = shl nuw nsw i64 %1249, 48
  %1251 = or i64 %1246, %1250
  %1252 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 7
  %1253 = load i8, i8 addrspace(4)* %1252, align 1, !tbaa !15
  %1254 = zext i8 %1253 to i64
  %1255 = shl nuw i64 %1254, 56
  %1256 = or i64 %1251, %1255
  %1257 = add nsw i32 %1214, -8
  %1258 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 8
  br label %1272

1259:                                             ; preds = %1217, %1259
  %1260 = phi i32 [ %1270, %1259 ], [ 0, %1217 ]
  %1261 = phi i64 [ %1269, %1259 ], [ 0, %1217 ]
  %1262 = zext i32 %1260 to i64
  %1263 = getelementptr inbounds i8, i8 addrspace(4)* %1213, i64 %1262
  %1264 = load i8, i8 addrspace(4)* %1263, align 1, !tbaa !15
  %1265 = zext i8 %1264 to i64
  %1266 = shl i32 %1260, 3
  %1267 = zext i32 %1266 to i64
  %1268 = shl nuw i64 %1265, %1267
  %1269 = or i64 %1268, %1261
  %1270 = add nuw nsw i32 %1260, 1
  %1271 = icmp eq i32 %1270, %1214
  br i1 %1271, label %1272, label %1259

1272:                                             ; preds = %1259, %1219, %1217
  %1273 = phi i8 addrspace(4)* [ %1258, %1219 ], [ %1213, %1217 ], [ %1213, %1259 ]
  %1274 = phi i32 [ %1257, %1219 ], [ 0, %1217 ], [ 0, %1259 ]
  %1275 = phi i64 [ %1256, %1219 ], [ 0, %1217 ], [ %1269, %1259 ]
  %1276 = icmp ugt i32 %1274, 7
  br i1 %1276, label %1279, label %1277

1277:                                             ; preds = %1272
  %1278 = icmp eq i32 %1274, 0
  br i1 %1278, label %1332, label %1319

1279:                                             ; preds = %1272
  %1280 = load i8, i8 addrspace(4)* %1273, align 1, !tbaa !15
  %1281 = zext i8 %1280 to i64
  %1282 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 1
  %1283 = load i8, i8 addrspace(4)* %1282, align 1, !tbaa !15
  %1284 = zext i8 %1283 to i64
  %1285 = shl nuw nsw i64 %1284, 8
  %1286 = or i64 %1285, %1281
  %1287 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 2
  %1288 = load i8, i8 addrspace(4)* %1287, align 1, !tbaa !15
  %1289 = zext i8 %1288 to i64
  %1290 = shl nuw nsw i64 %1289, 16
  %1291 = or i64 %1286, %1290
  %1292 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 3
  %1293 = load i8, i8 addrspace(4)* %1292, align 1, !tbaa !15
  %1294 = zext i8 %1293 to i64
  %1295 = shl nuw nsw i64 %1294, 24
  %1296 = or i64 %1291, %1295
  %1297 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 4
  %1298 = load i8, i8 addrspace(4)* %1297, align 1, !tbaa !15
  %1299 = zext i8 %1298 to i64
  %1300 = shl nuw nsw i64 %1299, 32
  %1301 = or i64 %1296, %1300
  %1302 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 5
  %1303 = load i8, i8 addrspace(4)* %1302, align 1, !tbaa !15
  %1304 = zext i8 %1303 to i64
  %1305 = shl nuw nsw i64 %1304, 40
  %1306 = or i64 %1301, %1305
  %1307 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 6
  %1308 = load i8, i8 addrspace(4)* %1307, align 1, !tbaa !15
  %1309 = zext i8 %1308 to i64
  %1310 = shl nuw nsw i64 %1309, 48
  %1311 = or i64 %1306, %1310
  %1312 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 7
  %1313 = load i8, i8 addrspace(4)* %1312, align 1, !tbaa !15
  %1314 = zext i8 %1313 to i64
  %1315 = shl nuw i64 %1314, 56
  %1316 = or i64 %1311, %1315
  %1317 = add nsw i32 %1274, -8
  %1318 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 8
  br label %1332

1319:                                             ; preds = %1277, %1319
  %1320 = phi i32 [ %1330, %1319 ], [ 0, %1277 ]
  %1321 = phi i64 [ %1329, %1319 ], [ 0, %1277 ]
  %1322 = zext i32 %1320 to i64
  %1323 = getelementptr inbounds i8, i8 addrspace(4)* %1273, i64 %1322
  %1324 = load i8, i8 addrspace(4)* %1323, align 1, !tbaa !15
  %1325 = zext i8 %1324 to i64
  %1326 = shl i32 %1320, 3
  %1327 = zext i32 %1326 to i64
  %1328 = shl nuw i64 %1325, %1327
  %1329 = or i64 %1328, %1321
  %1330 = add nuw nsw i32 %1320, 1
  %1331 = icmp eq i32 %1330, %1274
  br i1 %1331, label %1332, label %1319

1332:                                             ; preds = %1319, %1279, %1277
  %1333 = phi i8 addrspace(4)* [ %1318, %1279 ], [ %1273, %1277 ], [ %1273, %1319 ]
  %1334 = phi i32 [ %1317, %1279 ], [ 0, %1277 ], [ 0, %1319 ]
  %1335 = phi i64 [ %1316, %1279 ], [ 0, %1277 ], [ %1329, %1319 ]
  %1336 = icmp ugt i32 %1334, 7
  br i1 %1336, label %1339, label %1337

1337:                                             ; preds = %1332
  %1338 = icmp eq i32 %1334, 0
  br i1 %1338, label %1390, label %1377

1339:                                             ; preds = %1332
  %1340 = load i8, i8 addrspace(4)* %1333, align 1, !tbaa !15
  %1341 = zext i8 %1340 to i64
  %1342 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 1
  %1343 = load i8, i8 addrspace(4)* %1342, align 1, !tbaa !15
  %1344 = zext i8 %1343 to i64
  %1345 = shl nuw nsw i64 %1344, 8
  %1346 = or i64 %1345, %1341
  %1347 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 2
  %1348 = load i8, i8 addrspace(4)* %1347, align 1, !tbaa !15
  %1349 = zext i8 %1348 to i64
  %1350 = shl nuw nsw i64 %1349, 16
  %1351 = or i64 %1346, %1350
  %1352 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 3
  %1353 = load i8, i8 addrspace(4)* %1352, align 1, !tbaa !15
  %1354 = zext i8 %1353 to i64
  %1355 = shl nuw nsw i64 %1354, 24
  %1356 = or i64 %1351, %1355
  %1357 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 4
  %1358 = load i8, i8 addrspace(4)* %1357, align 1, !tbaa !15
  %1359 = zext i8 %1358 to i64
  %1360 = shl nuw nsw i64 %1359, 32
  %1361 = or i64 %1356, %1360
  %1362 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 5
  %1363 = load i8, i8 addrspace(4)* %1362, align 1, !tbaa !15
  %1364 = zext i8 %1363 to i64
  %1365 = shl nuw nsw i64 %1364, 40
  %1366 = or i64 %1361, %1365
  %1367 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 6
  %1368 = load i8, i8 addrspace(4)* %1367, align 1, !tbaa !15
  %1369 = zext i8 %1368 to i64
  %1370 = shl nuw nsw i64 %1369, 48
  %1371 = or i64 %1366, %1370
  %1372 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 7
  %1373 = load i8, i8 addrspace(4)* %1372, align 1, !tbaa !15
  %1374 = zext i8 %1373 to i64
  %1375 = shl nuw i64 %1374, 56
  %1376 = or i64 %1371, %1375
  br label %1390

1377:                                             ; preds = %1337, %1377
  %1378 = phi i32 [ %1388, %1377 ], [ 0, %1337 ]
  %1379 = phi i64 [ %1387, %1377 ], [ 0, %1337 ]
  %1380 = zext i32 %1378 to i64
  %1381 = getelementptr inbounds i8, i8 addrspace(4)* %1333, i64 %1380
  %1382 = load i8, i8 addrspace(4)* %1381, align 1, !tbaa !15
  %1383 = zext i8 %1382 to i64
  %1384 = shl i32 %1378, 3
  %1385 = zext i32 %1384 to i64
  %1386 = shl nuw i64 %1383, %1385
  %1387 = or i64 %1386, %1379
  %1388 = add nuw nsw i32 %1378, 1
  %1389 = icmp eq i32 %1388, %1334
  br i1 %1389, label %1390, label %1377

1390:                                             ; preds = %1377, %1339, %1337
  %1391 = phi i64 [ %1376, %1339 ], [ 0, %1337 ], [ %1387, %1377 ]
  %1392 = shl nuw nsw i64 %973, 2
  %1393 = add nuw nsw i64 %1392, 28
  %1394 = and i64 %1393, 480
  %1395 = and i64 %975, -225
  %1396 = or i64 %1395, %1394
  %1397 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef %1396, i64 noundef %1035, i64 noundef %1095, i64 noundef %1155, i64 noundef %1215, i64 noundef %1275, i64 noundef %1335, i64 noundef %1391) #10
  %1398 = sub i64 %965, %973
  %1399 = getelementptr inbounds i8, i8 addrspace(4)* %966, i64 %973
  %1400 = icmp eq i64 %1398, 0
  br i1 %1400, label %1401, label %964

1401:                                             ; preds = %1390, %957, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #3 {
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !21
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !25
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !21
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !26
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !30
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !29
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !31) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !32
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !34
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !35
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !26
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !29
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !36
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !36
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !37
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !39
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
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
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !29
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !26
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !36
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !36
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #6
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #6
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #6
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #6
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #6
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #6
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #6
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #4

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #5

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #6

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #4 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #5 = { mustprogress nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind readonly }
attributes #8 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #9 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!9, !9, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !9, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !9, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!28 = !{!"hsa_signal_s", !8, i64 0}
!29 = !{!27, !8, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !8, i64 0, !8, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !8, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !8, i64 0}
!37 = !{!38, !8, i64 16}
!38 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !24, i64 24, !24, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!39 = !{!38, !24, i64 24}
