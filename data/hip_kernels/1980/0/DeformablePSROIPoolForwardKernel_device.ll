; ModuleID = '../data/hip_kernels/1980/0/main.cu'
source_filename = "../data/hip_kernels/1980/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32DeformablePSROIPoolForwardKerneliPKddiiiiiS0_S0_idiiiiiiPdS1_(i32 %0, double addrspace(1)* nocapture readonly %1, double %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, i32 %10, double %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, double addrspace(1)* nocapture writeonly %18, double addrspace(1)* nocapture writeonly %19) local_unnamed_addr #0 {
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !6
  %30 = mul i32 %21, %26
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %32 = add i32 %30, %31
  %33 = icmp slt i32 %32, %0
  br i1 %33, label %34, label %58

34:                                               ; preds = %20
  %35 = sitofp i32 %6 to double
  %36 = sitofp i32 %7 to double
  %37 = sitofp i32 %12 to double
  %38 = sitofp i32 %15 to double
  %39 = icmp eq i32 %10, 0
  %40 = shl i32 %15, 1
  %41 = sitofp i32 %14 to double
  %42 = add nsw i32 %14, -1
  %43 = mul i32 %5, %4
  %44 = mul i32 %43, %3
  %45 = icmp sgt i32 %12, 0
  %46 = sitofp i32 %5 to double
  %47 = fadd contract double %46, -5.000000e-01
  %48 = sitofp i32 %4 to double
  %49 = fadd contract double %48, -5.000000e-01
  %50 = fadd contract double %46, -1.000000e+00
  %51 = fadd contract double %48, -1.000000e+00
  %52 = udiv i32 %29, %26
  %53 = mul i32 %52, %26
  %54 = icmp ugt i32 %29, %53
  %55 = zext i1 %54 to i32
  %56 = add i32 %52, %55
  %57 = mul i32 %56, %26
  br label %59

58:                                               ; preds = %197, %20
  ret void

59:                                               ; preds = %34, %197
  %60 = phi i32 [ %32, %34 ], [ %207, %197 ]
  %61 = freeze i32 %60
  %62 = freeze i32 %7
  %63 = sdiv i32 %61, %62
  %64 = mul i32 %63, %62
  %65 = sub i32 %61, %64
  %66 = freeze i32 %6
  %67 = sdiv i32 %63, %66
  %68 = mul i32 %67, %66
  %69 = sub i32 %63, %68
  %70 = freeze i32 %13
  %71 = sdiv i32 %67, %70
  %72 = mul i32 %71, %70
  %73 = sub i32 %67, %72
  %74 = mul nsw i32 %71, 5
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %8, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !16
  %78 = fptosi double %77 to i32
  %79 = getelementptr inbounds double, double addrspace(1)* %76, i64 1
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !16
  %81 = tail call double @llvm.round.f64(double %80)
  %82 = fmul contract double %81, %2
  %83 = fadd contract double %82, -5.000000e-01
  %84 = getelementptr inbounds double, double addrspace(1)* %76, i64 2
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !16
  %86 = tail call double @llvm.round.f64(double %85)
  %87 = fmul contract double %86, %2
  %88 = fadd contract double %87, -5.000000e-01
  %89 = getelementptr inbounds double, double addrspace(1)* %76, i64 3
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %91 = tail call double @llvm.round.f64(double %90)
  %92 = fadd contract double %91, 1.000000e+00
  %93 = fmul contract double %92, %2
  %94 = fadd contract double %93, -5.000000e-01
  %95 = getelementptr inbounds double, double addrspace(1)* %76, i64 4
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !16
  %97 = tail call double @llvm.round.f64(double %96)
  %98 = fadd contract double %97, 1.000000e+00
  %99 = fmul contract double %98, %2
  %100 = fadd contract double %99, -5.000000e-01
  %101 = fsub contract double %94, %83
  %102 = tail call double @llvm.maxnum.f64(double %101, double 1.000000e-01)
  %103 = fsub contract double %100, %88
  %104 = tail call double @llvm.maxnum.f64(double %103, double 1.000000e-01)
  %105 = fdiv contract double %104, %35
  %106 = fdiv contract double %102, %36
  %107 = fdiv contract double %105, %37
  %108 = fdiv contract double %106, %37
  %109 = sitofp i32 %69 to double
  %110 = fdiv contract double %109, %35
  %111 = fmul contract double %110, %38
  %112 = tail call double @llvm.floor.f64(double %111)
  %113 = fptosi double %112 to i32
  %114 = sitofp i32 %65 to double
  %115 = fdiv contract double %114, %36
  %116 = fmul contract double %115, %38
  %117 = tail call double @llvm.floor.f64(double %116)
  %118 = fptosi double %117 to i32
  %119 = sdiv i32 %73, %17
  br i1 %39, label %120, label %143

120:                                              ; preds = %59
  %121 = mul nsw i32 %71, %16
  %122 = add nsw i32 %119, %121
  %123 = mul i32 %40, %122
  %124 = add nsw i32 %123, %113
  %125 = mul nsw i32 %124, %15
  %126 = add nsw i32 %125, %118
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %9, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !16
  %130 = fmul contract double %129, %11
  %131 = mul nsw i32 %71, %16
  %132 = add nsw i32 %119, %131
  %133 = shl nsw i32 %132, 1
  %134 = add nuw nsw i32 %133, 1
  %135 = mul nsw i32 %134, %15
  %136 = add nsw i32 %135, %113
  %137 = mul nsw i32 %136, %15
  %138 = add nsw i32 %137, %118
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double addrspace(1)* %9, i64 %139
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !16
  %142 = fmul contract double %141, %11
  br label %143

143:                                              ; preds = %59, %120
  %144 = phi double [ %130, %120 ], [ 0.000000e+00, %59 ]
  %145 = phi contract double [ %142, %120 ], [ 0.000000e+00, %59 ]
  %146 = fmul contract double %106, %114
  %147 = fadd contract double %83, %146
  %148 = fmul contract double %102, %144
  %149 = fadd contract double %147, %148
  %150 = fmul contract double %105, %109
  %151 = fadd contract double %88, %150
  %152 = fmul contract double %104, %145
  %153 = fadd contract double %151, %152
  br i1 %45, label %154, label %197

154:                                              ; preds = %143
  %155 = mul i32 %44, %78
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds double, double addrspace(1)* %1, i64 %156
  %158 = fmul contract double %41, %109
  %159 = fdiv contract double %158, %35
  %160 = tail call double @llvm.floor.f64(double %159)
  %161 = fptosi double %160 to i32
  %162 = tail call i32 @llvm.smax.i32(i32 %161, i32 0)
  %163 = tail call i32 @llvm.smin.i32(i32 %162, i32 %42)
  %164 = fmul contract double %41, %114
  %165 = fdiv contract double %164, %36
  %166 = tail call double @llvm.floor.f64(double %165)
  %167 = fptosi double %166 to i32
  %168 = tail call i32 @llvm.smax.i32(i32 %167, i32 0)
  %169 = tail call i32 @llvm.smin.i32(i32 %168, i32 %42)
  %170 = mul nsw i32 %73, %14
  %171 = add nsw i32 %163, %170
  %172 = mul nsw i32 %171, %14
  %173 = add nsw i32 %172, %169
  %174 = mul i32 %43, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds double, double addrspace(1)* %157, i64 %175
  br label %177

177:                                              ; preds = %154, %209
  %178 = phi i32 [ 0, %154 ], [ %210, %209 ]
  %179 = phi i32 [ 0, %154 ], [ %265, %209 ]
  %180 = phi double [ 0.000000e+00, %154 ], [ %264, %209 ]
  %181 = sitofp i32 %178 to double
  %182 = fmul contract double %107, %181
  %183 = fadd contract double %153, %182
  %184 = fcmp contract olt double %183, -5.000000e-01
  %185 = fcmp contract ogt double %183, %49
  %186 = tail call double @llvm.maxnum.f64(double %183, double 0.000000e+00)
  %187 = tail call double @llvm.minnum.f64(double %186, double %51)
  %188 = tail call double @llvm.floor.f64(double %187)
  %189 = fptosi double %188 to i32
  %190 = tail call double @llvm.ceil.f64(double %187)
  %191 = fptosi double %190 to i32
  %192 = sitofp i32 %189 to double
  %193 = fsub contract double %187, %192
  %194 = mul nsw i32 %189, %5
  %195 = mul nsw i32 %191, %5
  %196 = fsub contract double 1.000000e+00, %193
  br label %212

197:                                              ; preds = %209, %143
  %198 = phi double [ 0.000000e+00, %143 ], [ %264, %209 ]
  %199 = phi i32 [ 0, %143 ], [ %265, %209 ]
  %200 = icmp eq i32 %199, 0
  %201 = sitofp i32 %199 to double
  %202 = fdiv contract double %198, %201
  %203 = select contract i1 %200, double 0.000000e+00, double %202
  %204 = sext i32 %60 to i64
  %205 = getelementptr inbounds double, double addrspace(1)* %18, i64 %204
  store double %203, double addrspace(1)* %205, align 8, !tbaa !16
  %206 = getelementptr inbounds double, double addrspace(1)* %19, i64 %204
  store double %201, double addrspace(1)* %206, align 8, !tbaa !16
  %207 = add i32 %57, %60
  %208 = icmp slt i32 %207, %0
  br i1 %208, label %59, label %58, !llvm.loop !20

209:                                              ; preds = %263
  %210 = add nuw nsw i32 %178, 1
  %211 = icmp eq i32 %210, %12
  br i1 %211, label %197, label %177, !llvm.loop !22

212:                                              ; preds = %177, %263
  %213 = phi i32 [ 0, %177 ], [ %266, %263 ]
  %214 = phi i32 [ %179, %177 ], [ %265, %263 ]
  %215 = phi double [ %180, %177 ], [ %264, %263 ]
  %216 = sitofp i32 %213 to double
  %217 = fmul contract double %108, %216
  %218 = fadd contract double %149, %217
  %219 = fcmp contract olt double %218, -5.000000e-01
  %220 = fcmp contract ogt double %218, %47
  %221 = select i1 %219, i1 true, i1 %220
  %222 = select i1 %221, i1 true, i1 %184
  %223 = select i1 %222, i1 true, i1 %185
  br i1 %223, label %263, label %224

224:                                              ; preds = %212
  %225 = tail call double @llvm.maxnum.f64(double %218, double 0.000000e+00)
  %226 = tail call double @llvm.minnum.f64(double %225, double %50)
  %227 = tail call double @llvm.floor.f64(double %226)
  %228 = fptosi double %227 to i32
  %229 = tail call double @llvm.ceil.f64(double %226)
  %230 = fptosi double %229 to i32
  %231 = sitofp i32 %228 to double
  %232 = fsub contract double %226, %231
  %233 = add nsw i32 %194, %228
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds double, double addrspace(1)* %176, i64 %234
  %236 = load double, double addrspace(1)* %235, align 8, !tbaa !16
  %237 = add nsw i32 %195, %228
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds double, double addrspace(1)* %176, i64 %238
  %240 = load double, double addrspace(1)* %239, align 8, !tbaa !16
  %241 = add nsw i32 %194, %230
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds double, double addrspace(1)* %176, i64 %242
  %244 = load double, double addrspace(1)* %243, align 8, !tbaa !16
  %245 = add nsw i32 %195, %230
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds double, double addrspace(1)* %176, i64 %246
  %248 = load double, double addrspace(1)* %247, align 8, !tbaa !16
  %249 = fsub contract double 1.000000e+00, %232
  %250 = fmul contract double %196, %249
  %251 = fmul contract double %250, %236
  %252 = fmul contract double %193, %249
  %253 = fmul contract double %252, %240
  %254 = fadd contract double %251, %253
  %255 = fmul contract double %196, %232
  %256 = fmul contract double %255, %244
  %257 = fadd contract double %254, %256
  %258 = fmul contract double %193, %232
  %259 = fmul contract double %258, %248
  %260 = fadd contract double %257, %259
  %261 = fadd contract double %215, %260
  %262 = add nsw i32 %214, 1
  br label %263

263:                                              ; preds = %212, %224
  %264 = phi double [ %261, %224 ], [ %215, %212 ]
  %265 = phi i32 [ %262, %224 ], [ %214, %212 ]
  %266 = add nuw nsw i32 %213, 1
  %267 = icmp eq i32 %266, %12
  br i1 %267, label %209, label %212, !llvm.loop !23
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.round.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
