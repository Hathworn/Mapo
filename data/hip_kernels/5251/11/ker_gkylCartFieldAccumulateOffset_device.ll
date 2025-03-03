; ModuleID = '../data/hip_kernels/5251/11/main.cu'
source_filename = "../data/hip_kernels/5251/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z33ker_gkylCartFieldAccumulateOffsetjjjjjjdPKdPd(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, double %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = icmp ult i32 %4, %5
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp ult i32 %22, %2
  br i1 %10, label %24, label %159

24:                                               ; preds = %9
  br i1 %23, label %25, label %294

25:                                               ; preds = %24
  %26 = icmp eq i32 %4, 0
  %27 = add i32 %3, %1
  %28 = udiv i32 %19, %16
  %29 = mul i32 %28, %16
  %30 = icmp ugt i32 %19, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %16
  %34 = and i32 %4, 7
  %35 = icmp ult i32 %4, 8
  %36 = and i32 %4, -8
  %37 = icmp eq i32 %34, 0
  br label %38

38:                                               ; preds = %25, %63
  %39 = phi i32 [ %22, %25 ], [ %64, %63 ]
  br i1 %26, label %63, label %40

40:                                               ; preds = %38
  %41 = mul i32 %39, %4
  %42 = add i32 %41, %0
  %43 = mul i32 %39, %5
  %44 = add i32 %27, %43
  br i1 %35, label %45, label %66

45:                                               ; preds = %66, %40
  %46 = phi i32 [ 0, %40 ], [ %156, %66 ]
  br i1 %37, label %63, label %47

47:                                               ; preds = %45, %47
  %48 = phi i32 [ %60, %47 ], [ %46, %45 ]
  %49 = phi i32 [ %61, %47 ], [ 0, %45 ]
  %50 = add i32 %42, %48
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %7, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = fmul contract double %53, %6
  %55 = add i32 %44, %48
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %8, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !16
  %59 = fadd contract double %58, %54
  store double %59, double addrspace(1)* %57, align 8, !tbaa !16
  %60 = add nuw i32 %48, 1
  %61 = add i32 %49, 1
  %62 = icmp eq i32 %61, %34
  br i1 %62, label %63, label %47, !llvm.loop !20

63:                                               ; preds = %45, %47, %38
  %64 = add i32 %33, %39
  %65 = icmp ult i32 %64, %2
  br i1 %65, label %38, label %294, !llvm.loop !22

66:                                               ; preds = %40, %66
  %67 = phi i32 [ %156, %66 ], [ 0, %40 ]
  %68 = phi i32 [ %157, %66 ], [ 0, %40 ]
  %69 = add i32 %42, %67
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %7, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !16
  %73 = fmul contract double %72, %6
  %74 = add i32 %44, %67
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %8, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !16
  %78 = fadd contract double %77, %73
  store double %78, double addrspace(1)* %76, align 8, !tbaa !16
  %79 = or i32 %67, 1
  %80 = add i32 %42, %79
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %7, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !16
  %84 = fmul contract double %83, %6
  %85 = add i32 %44, %79
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %8, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !16
  %89 = fadd contract double %88, %84
  store double %89, double addrspace(1)* %87, align 8, !tbaa !16
  %90 = or i32 %67, 2
  %91 = add i32 %42, %90
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %7, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !16
  %95 = fmul contract double %94, %6
  %96 = add i32 %44, %90
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %8, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %100 = fadd contract double %99, %95
  store double %100, double addrspace(1)* %98, align 8, !tbaa !16
  %101 = or i32 %67, 3
  %102 = add i32 %42, %101
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %7, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !16
  %106 = fmul contract double %105, %6
  %107 = add i32 %44, %101
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %8, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !16
  %111 = fadd contract double %110, %106
  store double %111, double addrspace(1)* %109, align 8, !tbaa !16
  %112 = or i32 %67, 4
  %113 = add i32 %42, %112
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %7, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !16
  %117 = fmul contract double %116, %6
  %118 = add i32 %44, %112
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %8, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !16
  %122 = fadd contract double %121, %117
  store double %122, double addrspace(1)* %120, align 8, !tbaa !16
  %123 = or i32 %67, 5
  %124 = add i32 %42, %123
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %7, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !16
  %128 = fmul contract double %127, %6
  %129 = add i32 %44, %123
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %8, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !16
  %133 = fadd contract double %132, %128
  store double %133, double addrspace(1)* %131, align 8, !tbaa !16
  %134 = or i32 %67, 6
  %135 = add i32 %42, %134
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %7, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !16
  %139 = fmul contract double %138, %6
  %140 = add i32 %44, %134
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds double, double addrspace(1)* %8, i64 %141
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !16
  %144 = fadd contract double %143, %139
  store double %144, double addrspace(1)* %142, align 8, !tbaa !16
  %145 = or i32 %67, 7
  %146 = add i32 %42, %145
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds double, double addrspace(1)* %7, i64 %147
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !16
  %150 = fmul contract double %149, %6
  %151 = add i32 %44, %145
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %8, i64 %152
  %154 = load double, double addrspace(1)* %153, align 8, !tbaa !16
  %155 = fadd contract double %154, %150
  store double %155, double addrspace(1)* %153, align 8, !tbaa !16
  %156 = add nuw i32 %67, 8
  %157 = add i32 %68, 8
  %158 = icmp eq i32 %157, %36
  br i1 %158, label %45, label %66, !llvm.loop !24

159:                                              ; preds = %9
  br i1 %23, label %160, label %294

160:                                              ; preds = %159
  %161 = icmp eq i32 %5, 0
  %162 = add i32 %3, %0
  %163 = udiv i32 %19, %16
  %164 = mul i32 %163, %16
  %165 = icmp ugt i32 %19, %164
  %166 = zext i1 %165 to i32
  %167 = add i32 %163, %166
  %168 = mul i32 %167, %16
  %169 = and i32 %5, 7
  %170 = icmp ult i32 %5, 8
  %171 = and i32 %5, -8
  %172 = icmp eq i32 %169, 0
  br label %173

173:                                              ; preds = %160, %198
  %174 = phi i32 [ %22, %160 ], [ %199, %198 ]
  br i1 %161, label %198, label %175

175:                                              ; preds = %173
  %176 = mul i32 %174, %4
  %177 = add i32 %162, %176
  %178 = mul i32 %174, %5
  %179 = add i32 %178, %1
  br i1 %170, label %180, label %201

180:                                              ; preds = %201, %175
  %181 = phi i32 [ 0, %175 ], [ %291, %201 ]
  br i1 %172, label %198, label %182

182:                                              ; preds = %180, %182
  %183 = phi i32 [ %195, %182 ], [ %181, %180 ]
  %184 = phi i32 [ %196, %182 ], [ 0, %180 ]
  %185 = add i32 %177, %183
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds double, double addrspace(1)* %7, i64 %186
  %188 = load double, double addrspace(1)* %187, align 8, !tbaa !16
  %189 = fmul contract double %188, %6
  %190 = add i32 %179, %183
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds double, double addrspace(1)* %8, i64 %191
  %193 = load double, double addrspace(1)* %192, align 8, !tbaa !16
  %194 = fadd contract double %193, %189
  store double %194, double addrspace(1)* %192, align 8, !tbaa !16
  %195 = add nuw i32 %183, 1
  %196 = add i32 %184, 1
  %197 = icmp eq i32 %196, %169
  br i1 %197, label %198, label %182, !llvm.loop !25

198:                                              ; preds = %180, %182, %173
  %199 = add i32 %168, %174
  %200 = icmp ult i32 %199, %2
  br i1 %200, label %173, label %294, !llvm.loop !26

201:                                              ; preds = %175, %201
  %202 = phi i32 [ %291, %201 ], [ 0, %175 ]
  %203 = phi i32 [ %292, %201 ], [ 0, %175 ]
  %204 = add i32 %177, %202
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds double, double addrspace(1)* %7, i64 %205
  %207 = load double, double addrspace(1)* %206, align 8, !tbaa !16
  %208 = fmul contract double %207, %6
  %209 = add i32 %179, %202
  %210 = zext i32 %209 to i64
  %211 = getelementptr inbounds double, double addrspace(1)* %8, i64 %210
  %212 = load double, double addrspace(1)* %211, align 8, !tbaa !16
  %213 = fadd contract double %212, %208
  store double %213, double addrspace(1)* %211, align 8, !tbaa !16
  %214 = or i32 %202, 1
  %215 = add i32 %177, %214
  %216 = zext i32 %215 to i64
  %217 = getelementptr inbounds double, double addrspace(1)* %7, i64 %216
  %218 = load double, double addrspace(1)* %217, align 8, !tbaa !16
  %219 = fmul contract double %218, %6
  %220 = add i32 %179, %214
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds double, double addrspace(1)* %8, i64 %221
  %223 = load double, double addrspace(1)* %222, align 8, !tbaa !16
  %224 = fadd contract double %223, %219
  store double %224, double addrspace(1)* %222, align 8, !tbaa !16
  %225 = or i32 %202, 2
  %226 = add i32 %177, %225
  %227 = zext i32 %226 to i64
  %228 = getelementptr inbounds double, double addrspace(1)* %7, i64 %227
  %229 = load double, double addrspace(1)* %228, align 8, !tbaa !16
  %230 = fmul contract double %229, %6
  %231 = add i32 %179, %225
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds double, double addrspace(1)* %8, i64 %232
  %234 = load double, double addrspace(1)* %233, align 8, !tbaa !16
  %235 = fadd contract double %234, %230
  store double %235, double addrspace(1)* %233, align 8, !tbaa !16
  %236 = or i32 %202, 3
  %237 = add i32 %177, %236
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds double, double addrspace(1)* %7, i64 %238
  %240 = load double, double addrspace(1)* %239, align 8, !tbaa !16
  %241 = fmul contract double %240, %6
  %242 = add i32 %179, %236
  %243 = zext i32 %242 to i64
  %244 = getelementptr inbounds double, double addrspace(1)* %8, i64 %243
  %245 = load double, double addrspace(1)* %244, align 8, !tbaa !16
  %246 = fadd contract double %245, %241
  store double %246, double addrspace(1)* %244, align 8, !tbaa !16
  %247 = or i32 %202, 4
  %248 = add i32 %177, %247
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds double, double addrspace(1)* %7, i64 %249
  %251 = load double, double addrspace(1)* %250, align 8, !tbaa !16
  %252 = fmul contract double %251, %6
  %253 = add i32 %179, %247
  %254 = zext i32 %253 to i64
  %255 = getelementptr inbounds double, double addrspace(1)* %8, i64 %254
  %256 = load double, double addrspace(1)* %255, align 8, !tbaa !16
  %257 = fadd contract double %256, %252
  store double %257, double addrspace(1)* %255, align 8, !tbaa !16
  %258 = or i32 %202, 5
  %259 = add i32 %177, %258
  %260 = zext i32 %259 to i64
  %261 = getelementptr inbounds double, double addrspace(1)* %7, i64 %260
  %262 = load double, double addrspace(1)* %261, align 8, !tbaa !16
  %263 = fmul contract double %262, %6
  %264 = add i32 %179, %258
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds double, double addrspace(1)* %8, i64 %265
  %267 = load double, double addrspace(1)* %266, align 8, !tbaa !16
  %268 = fadd contract double %267, %263
  store double %268, double addrspace(1)* %266, align 8, !tbaa !16
  %269 = or i32 %202, 6
  %270 = add i32 %177, %269
  %271 = zext i32 %270 to i64
  %272 = getelementptr inbounds double, double addrspace(1)* %7, i64 %271
  %273 = load double, double addrspace(1)* %272, align 8, !tbaa !16
  %274 = fmul contract double %273, %6
  %275 = add i32 %179, %269
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds double, double addrspace(1)* %8, i64 %276
  %278 = load double, double addrspace(1)* %277, align 8, !tbaa !16
  %279 = fadd contract double %278, %274
  store double %279, double addrspace(1)* %277, align 8, !tbaa !16
  %280 = or i32 %202, 7
  %281 = add i32 %177, %280
  %282 = zext i32 %281 to i64
  %283 = getelementptr inbounds double, double addrspace(1)* %7, i64 %282
  %284 = load double, double addrspace(1)* %283, align 8, !tbaa !16
  %285 = fmul contract double %284, %6
  %286 = add i32 %179, %280
  %287 = zext i32 %286 to i64
  %288 = getelementptr inbounds double, double addrspace(1)* %8, i64 %287
  %289 = load double, double addrspace(1)* %288, align 8, !tbaa !16
  %290 = fadd contract double %289, %285
  store double %290, double addrspace(1)* %288, align 8, !tbaa !16
  %291 = add nuw i32 %202, 8
  %292 = add i32 %203, 8
  %293 = icmp eq i32 %292, %171
  br i1 %293, label %180, label %201, !llvm.loop !27

294:                                              ; preds = %198, %63, %159, %24
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !23}
!27 = distinct !{!27, !23}
