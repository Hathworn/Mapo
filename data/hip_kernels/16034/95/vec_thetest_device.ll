; ModuleID = '../data/hip_kernels/16034/95/main.cu'
source_filename = "../data/hip_kernels/16034/95/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [16 x i8] c"kz -> %d  %f  \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @vec_thetest(i32 %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %13
  %21 = udiv i32 %12, %9
  %22 = mul i32 %21, %9
  %23 = icmp ugt i32 %12, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = add i32 %26, %4
  %28 = mul i32 %27, %9
  %29 = add i32 %28, %3
  %30 = icmp slt i32 %29, %0
  br i1 %30, label %31, label %501

31:                                               ; preds = %2
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !6
  %35 = fpext float %34 to double
  %36 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 24
  %38 = bitcast i8 addrspace(4)* %37 to i64 addrspace(4)*
  %39 = load i64, i64 addrspace(4)* %38, align 8, !tbaa !20
  %40 = inttoptr i64 %39 to i8 addrspace(1)*
  %41 = addrspacecast i8 addrspace(1)* %40 to i8*
  %42 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %41, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %43 = extractelement <2 x i64> %42, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %44, label %48

44:                                               ; preds = %31
  %45 = and i64 %43, -225
  %46 = or i64 %45, 32
  %47 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %41, i64 noundef %46, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %489

48:                                               ; preds = %31
  %49 = and i64 %43, 2
  %50 = and i64 %43, -3
  %51 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %50, i64 0
  br label %52

52:                                               ; preds = %478, %48
  %53 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str to [16 x i8]*) to i64)), i64 1))), %48 ], [ %486, %478 ]
  %54 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0), %48 ], [ %487, %478 ]
  %55 = phi <2 x i64> [ %51, %48 ], [ %485, %478 ]
  %56 = icmp ugt i64 %53, 56
  %57 = extractelement <2 x i64> %55, i64 0
  %58 = or i64 %57, %49
  %59 = insertelement <2 x i64> poison, i64 %58, i64 0
  %60 = select i1 %56, <2 x i64> %55, <2 x i64> %59
  %61 = tail call i64 @llvm.umin.i64(i64 %53, i64 56)
  %62 = trunc i64 %61 to i32
  %63 = extractelement <2 x i64> %60, i64 0
  %64 = icmp ugt i32 %62, 7
  br i1 %64, label %67, label %65

65:                                               ; preds = %52
  %66 = icmp eq i32 %62, 0
  br i1 %66, label %120, label %107

67:                                               ; preds = %52
  %68 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !21
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 1
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !21
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 8
  %74 = or i64 %73, %69
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 2
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !21
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 16
  %79 = or i64 %74, %78
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 3
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !21
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 24
  %84 = or i64 %79, %83
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 4
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !21
  %87 = zext i8 %86 to i64
  %88 = shl nuw nsw i64 %87, 32
  %89 = or i64 %84, %88
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 5
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !21
  %92 = zext i8 %91 to i64
  %93 = shl nuw nsw i64 %92, 40
  %94 = or i64 %89, %93
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 6
  %96 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !21
  %97 = zext i8 %96 to i64
  %98 = shl nuw nsw i64 %97, 48
  %99 = or i64 %94, %98
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 7
  %101 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !21
  %102 = zext i8 %101 to i64
  %103 = shl nuw i64 %102, 56
  %104 = or i64 %99, %103
  %105 = add nsw i32 %62, -8
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 8
  br label %120

107:                                              ; preds = %65, %107
  %108 = phi i32 [ %118, %107 ], [ 0, %65 ]
  %109 = phi i64 [ %117, %107 ], [ 0, %65 ]
  %110 = zext i32 %108 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 %110
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !21
  %113 = zext i8 %112 to i64
  %114 = shl i32 %108, 3
  %115 = zext i32 %114 to i64
  %116 = shl nuw i64 %113, %115
  %117 = or i64 %116, %109
  %118 = add nuw nsw i32 %108, 1
  %119 = icmp eq i32 %118, %62
  br i1 %119, label %120, label %107, !llvm.loop !22

120:                                              ; preds = %107, %67, %65
  %121 = phi i8 addrspace(4)* [ %106, %67 ], [ %54, %65 ], [ %54, %107 ]
  %122 = phi i32 [ %105, %67 ], [ 0, %65 ], [ 0, %107 ]
  %123 = phi i64 [ %104, %67 ], [ 0, %65 ], [ %117, %107 ]
  %124 = icmp ugt i32 %122, 7
  br i1 %124, label %127, label %125

125:                                              ; preds = %120
  %126 = icmp eq i32 %122, 0
  br i1 %126, label %180, label %167

127:                                              ; preds = %120
  %128 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !21
  %129 = zext i8 %128 to i64
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 1
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !21
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 8
  %134 = or i64 %133, %129
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 2
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !21
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 16
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 3
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !21
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 24
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 4
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !21
  %147 = zext i8 %146 to i64
  %148 = shl nuw nsw i64 %147, 32
  %149 = or i64 %144, %148
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 5
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !21
  %152 = zext i8 %151 to i64
  %153 = shl nuw nsw i64 %152, 40
  %154 = or i64 %149, %153
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 6
  %156 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !21
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 48
  %159 = or i64 %154, %158
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 7
  %161 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !21
  %162 = zext i8 %161 to i64
  %163 = shl nuw i64 %162, 56
  %164 = or i64 %159, %163
  %165 = add nsw i32 %122, -8
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 8
  br label %180

167:                                              ; preds = %125, %167
  %168 = phi i32 [ %178, %167 ], [ 0, %125 ]
  %169 = phi i64 [ %177, %167 ], [ 0, %125 ]
  %170 = zext i32 %168 to i64
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %121, i64 %170
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !21
  %173 = zext i8 %172 to i64
  %174 = shl i32 %168, 3
  %175 = zext i32 %174 to i64
  %176 = shl nuw i64 %173, %175
  %177 = or i64 %176, %169
  %178 = add nuw nsw i32 %168, 1
  %179 = icmp eq i32 %178, %122
  br i1 %179, label %180, label %167

180:                                              ; preds = %167, %127, %125
  %181 = phi i8 addrspace(4)* [ %166, %127 ], [ %121, %125 ], [ %121, %167 ]
  %182 = phi i32 [ %165, %127 ], [ 0, %125 ], [ 0, %167 ]
  %183 = phi i64 [ %164, %127 ], [ 0, %125 ], [ %177, %167 ]
  %184 = icmp ugt i32 %182, 7
  br i1 %184, label %187, label %185

185:                                              ; preds = %180
  %186 = icmp eq i32 %182, 0
  br i1 %186, label %240, label %227

187:                                              ; preds = %180
  %188 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !21
  %189 = zext i8 %188 to i64
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 1
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !21
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 8
  %194 = or i64 %193, %189
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 2
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !21
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 16
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 3
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !21
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 24
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 4
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !21
  %207 = zext i8 %206 to i64
  %208 = shl nuw nsw i64 %207, 32
  %209 = or i64 %204, %208
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 5
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !21
  %212 = zext i8 %211 to i64
  %213 = shl nuw nsw i64 %212, 40
  %214 = or i64 %209, %213
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 6
  %216 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !21
  %217 = zext i8 %216 to i64
  %218 = shl nuw nsw i64 %217, 48
  %219 = or i64 %214, %218
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 7
  %221 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !21
  %222 = zext i8 %221 to i64
  %223 = shl nuw i64 %222, 56
  %224 = or i64 %219, %223
  %225 = add nsw i32 %182, -8
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 8
  br label %240

227:                                              ; preds = %185, %227
  %228 = phi i32 [ %238, %227 ], [ 0, %185 ]
  %229 = phi i64 [ %237, %227 ], [ 0, %185 ]
  %230 = zext i32 %228 to i64
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %181, i64 %230
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !21
  %233 = zext i8 %232 to i64
  %234 = shl i32 %228, 3
  %235 = zext i32 %234 to i64
  %236 = shl nuw i64 %233, %235
  %237 = or i64 %236, %229
  %238 = add nuw nsw i32 %228, 1
  %239 = icmp eq i32 %238, %182
  br i1 %239, label %240, label %227

240:                                              ; preds = %227, %187, %185
  %241 = phi i8 addrspace(4)* [ %226, %187 ], [ %181, %185 ], [ %181, %227 ]
  %242 = phi i32 [ %225, %187 ], [ 0, %185 ], [ 0, %227 ]
  %243 = phi i64 [ %224, %187 ], [ 0, %185 ], [ %237, %227 ]
  %244 = icmp ugt i32 %242, 7
  br i1 %244, label %247, label %245

245:                                              ; preds = %240
  %246 = icmp eq i32 %242, 0
  br i1 %246, label %300, label %287

247:                                              ; preds = %240
  %248 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !21
  %249 = zext i8 %248 to i64
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 1
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !21
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 8
  %254 = or i64 %253, %249
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 2
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !21
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 16
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 3
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !21
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 24
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 4
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !21
  %267 = zext i8 %266 to i64
  %268 = shl nuw nsw i64 %267, 32
  %269 = or i64 %264, %268
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 5
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !21
  %272 = zext i8 %271 to i64
  %273 = shl nuw nsw i64 %272, 40
  %274 = or i64 %269, %273
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 6
  %276 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !21
  %277 = zext i8 %276 to i64
  %278 = shl nuw nsw i64 %277, 48
  %279 = or i64 %274, %278
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 7
  %281 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !21
  %282 = zext i8 %281 to i64
  %283 = shl nuw i64 %282, 56
  %284 = or i64 %279, %283
  %285 = add nsw i32 %242, -8
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 8
  br label %300

287:                                              ; preds = %245, %287
  %288 = phi i32 [ %298, %287 ], [ 0, %245 ]
  %289 = phi i64 [ %297, %287 ], [ 0, %245 ]
  %290 = zext i32 %288 to i64
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %241, i64 %290
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !21
  %293 = zext i8 %292 to i64
  %294 = shl i32 %288, 3
  %295 = zext i32 %294 to i64
  %296 = shl nuw i64 %293, %295
  %297 = or i64 %296, %289
  %298 = add nuw nsw i32 %288, 1
  %299 = icmp eq i32 %298, %242
  br i1 %299, label %300, label %287

300:                                              ; preds = %287, %247, %245
  %301 = phi i8 addrspace(4)* [ %286, %247 ], [ %241, %245 ], [ %241, %287 ]
  %302 = phi i32 [ %285, %247 ], [ 0, %245 ], [ 0, %287 ]
  %303 = phi i64 [ %284, %247 ], [ 0, %245 ], [ %297, %287 ]
  %304 = icmp ugt i32 %302, 7
  br i1 %304, label %307, label %305

305:                                              ; preds = %300
  %306 = icmp eq i32 %302, 0
  br i1 %306, label %360, label %347

307:                                              ; preds = %300
  %308 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !21
  %309 = zext i8 %308 to i64
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 1
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !21
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 8
  %314 = or i64 %313, %309
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 2
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !21
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 16
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 3
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !21
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 24
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 4
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !21
  %327 = zext i8 %326 to i64
  %328 = shl nuw nsw i64 %327, 32
  %329 = or i64 %324, %328
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 5
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !21
  %332 = zext i8 %331 to i64
  %333 = shl nuw nsw i64 %332, 40
  %334 = or i64 %329, %333
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 6
  %336 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !21
  %337 = zext i8 %336 to i64
  %338 = shl nuw nsw i64 %337, 48
  %339 = or i64 %334, %338
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 7
  %341 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !21
  %342 = zext i8 %341 to i64
  %343 = shl nuw i64 %342, 56
  %344 = or i64 %339, %343
  %345 = add nsw i32 %302, -8
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 8
  br label %360

347:                                              ; preds = %305, %347
  %348 = phi i32 [ %358, %347 ], [ 0, %305 ]
  %349 = phi i64 [ %357, %347 ], [ 0, %305 ]
  %350 = zext i32 %348 to i64
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %301, i64 %350
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !21
  %353 = zext i8 %352 to i64
  %354 = shl i32 %348, 3
  %355 = zext i32 %354 to i64
  %356 = shl nuw i64 %353, %355
  %357 = or i64 %356, %349
  %358 = add nuw nsw i32 %348, 1
  %359 = icmp eq i32 %358, %302
  br i1 %359, label %360, label %347

360:                                              ; preds = %347, %307, %305
  %361 = phi i8 addrspace(4)* [ %346, %307 ], [ %301, %305 ], [ %301, %347 ]
  %362 = phi i32 [ %345, %307 ], [ 0, %305 ], [ 0, %347 ]
  %363 = phi i64 [ %344, %307 ], [ 0, %305 ], [ %357, %347 ]
  %364 = icmp ugt i32 %362, 7
  br i1 %364, label %367, label %365

365:                                              ; preds = %360
  %366 = icmp eq i32 %362, 0
  br i1 %366, label %420, label %407

367:                                              ; preds = %360
  %368 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !21
  %369 = zext i8 %368 to i64
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 1
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !21
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 8
  %374 = or i64 %373, %369
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 2
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !21
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 16
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 3
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !21
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 24
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 4
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !21
  %387 = zext i8 %386 to i64
  %388 = shl nuw nsw i64 %387, 32
  %389 = or i64 %384, %388
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 5
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !21
  %392 = zext i8 %391 to i64
  %393 = shl nuw nsw i64 %392, 40
  %394 = or i64 %389, %393
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 6
  %396 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !21
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 48
  %399 = or i64 %394, %398
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 7
  %401 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !21
  %402 = zext i8 %401 to i64
  %403 = shl nuw i64 %402, 56
  %404 = or i64 %399, %403
  %405 = add nsw i32 %362, -8
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 8
  br label %420

407:                                              ; preds = %365, %407
  %408 = phi i32 [ %418, %407 ], [ 0, %365 ]
  %409 = phi i64 [ %417, %407 ], [ 0, %365 ]
  %410 = zext i32 %408 to i64
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %361, i64 %410
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !21
  %413 = zext i8 %412 to i64
  %414 = shl i32 %408, 3
  %415 = zext i32 %414 to i64
  %416 = shl nuw i64 %413, %415
  %417 = or i64 %416, %409
  %418 = add nuw nsw i32 %408, 1
  %419 = icmp eq i32 %418, %362
  br i1 %419, label %420, label %407

420:                                              ; preds = %407, %367, %365
  %421 = phi i8 addrspace(4)* [ %406, %367 ], [ %361, %365 ], [ %361, %407 ]
  %422 = phi i32 [ %405, %367 ], [ 0, %365 ], [ 0, %407 ]
  %423 = phi i64 [ %404, %367 ], [ 0, %365 ], [ %417, %407 ]
  %424 = icmp ugt i32 %422, 7
  br i1 %424, label %427, label %425

425:                                              ; preds = %420
  %426 = icmp eq i32 %422, 0
  br i1 %426, label %478, label %465

427:                                              ; preds = %420
  %428 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !21
  %429 = zext i8 %428 to i64
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 1
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !21
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 8
  %434 = or i64 %433, %429
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 2
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !21
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 16
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 3
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !21
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 24
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 4
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !21
  %447 = zext i8 %446 to i64
  %448 = shl nuw nsw i64 %447, 32
  %449 = or i64 %444, %448
  %450 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 5
  %451 = load i8, i8 addrspace(4)* %450, align 1, !tbaa !21
  %452 = zext i8 %451 to i64
  %453 = shl nuw nsw i64 %452, 40
  %454 = or i64 %449, %453
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 6
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !21
  %457 = zext i8 %456 to i64
  %458 = shl nuw nsw i64 %457, 48
  %459 = or i64 %454, %458
  %460 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 7
  %461 = load i8, i8 addrspace(4)* %460, align 1, !tbaa !21
  %462 = zext i8 %461 to i64
  %463 = shl nuw i64 %462, 56
  %464 = or i64 %459, %463
  br label %478

465:                                              ; preds = %425, %465
  %466 = phi i32 [ %476, %465 ], [ 0, %425 ]
  %467 = phi i64 [ %475, %465 ], [ 0, %425 ]
  %468 = zext i32 %466 to i64
  %469 = getelementptr inbounds i8, i8 addrspace(4)* %421, i64 %468
  %470 = load i8, i8 addrspace(4)* %469, align 1, !tbaa !21
  %471 = zext i8 %470 to i64
  %472 = shl i32 %466, 3
  %473 = zext i32 %472 to i64
  %474 = shl nuw i64 %471, %473
  %475 = or i64 %474, %467
  %476 = add nuw nsw i32 %466, 1
  %477 = icmp eq i32 %476, %422
  br i1 %477, label %478, label %465

478:                                              ; preds = %465, %427, %425
  %479 = phi i64 [ %464, %427 ], [ 0, %425 ], [ %475, %465 ]
  %480 = shl nuw nsw i64 %61, 2
  %481 = add nuw nsw i64 %480, 28
  %482 = and i64 %481, 480
  %483 = and i64 %63, -225
  %484 = or i64 %483, %482
  %485 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %41, i64 noundef %484, i64 noundef %123, i64 noundef %183, i64 noundef %243, i64 noundef %303, i64 noundef %363, i64 noundef %423, i64 noundef %479) #10
  %486 = sub i64 %53, %61
  %487 = getelementptr inbounds i8, i8 addrspace(4)* %54, i64 %61
  %488 = icmp eq i64 %486, 0
  br i1 %488, label %489, label %52

489:                                              ; preds = %478, %44
  %490 = phi <2 x i64> [ %47, %44 ], [ %485, %478 ]
  %491 = extractelement <2 x i64> %490, i64 0
  %492 = zext i32 %29 to i64
  %493 = and i64 %491, -225
  %494 = or i64 %493, 32
  %495 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %41, i64 noundef %494, i64 noundef %492, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %496 = extractelement <2 x i64> %495, i64 0
  %497 = bitcast double %35 to i64
  %498 = and i64 %496, -227
  %499 = or i64 %498, 34
  %500 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %41, i64 noundef %499, i64 noundef %497, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %501

501:                                              ; preds = %489, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !24
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !25
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !20
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !20
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !20
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !20
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !20
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !20
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !20
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !20
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !25
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !26
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !25
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !25
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !24
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !20
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !20
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !27
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !20
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !30
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !29
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !25
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !20
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !20
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !20
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !20
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !20
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !20
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !20
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !20
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !20
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !20
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !20
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !20
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !20
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !20
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !20
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !20
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !20
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !27
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
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !20
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !20
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !21
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !20
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !27
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !21
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!13, !13, i64 0}
!21 = !{!10, !10, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = !{!14, !14, i64 0}
!25 = !{!12, !12, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !14, i64 0}
!28 = !{!"", !14, i64 0, !14, i64 8, !15, i64 16, !13, i64 24, !13, i64 32, !13, i64 40}
!29 = !{!28, !13, i64 40}
!30 = !{!28, !14, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !12, i64 16}
!33 = !{!"", !13, i64 0, !13, i64 8, !12, i64 16, !12, i64 20}
!34 = !{!33, !13, i64 8}
!35 = !{!33, !12, i64 20}
!36 = !{!33, !13, i64 0}
!37 = !{!38, !13, i64 16}
!38 = !{!"amd_signal_s", !13, i64 0, !10, i64 8, !13, i64 16, !12, i64 24, !12, i64 28, !13, i64 32, !13, i64 40, !10, i64 48, !10, i64 56}
!39 = !{!38, !12, i64 24}
