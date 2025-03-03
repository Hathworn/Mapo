; ModuleID = '../data/hip_kernels/899/10/main.cu'
source_filename = "../data/hip_kernels/899/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12gpu_find_haciiPKdPdE8s_hac_xi = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_haciiPKdPdE8s_hac_xo = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_haciiPKdPdE8s_hac_yi = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_haciiPKdPdE8s_hac_yo = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16
@_ZZ12gpu_find_haciiPKdPdE7s_hac_z = internal unnamed_addr addrspace(3) global [128 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12gpu_find_haciiPKdPd(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = sub nsw i32 %1, %6
  %8 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_xi, i32 0, i32 %5
  store double 0.000000e+00, double addrspace(3)* %8, align 8, !tbaa !5
  %9 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_xo, i32 0, i32 %5
  store double 0.000000e+00, double addrspace(3)* %9, align 8, !tbaa !5
  %10 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_yi, i32 0, i32 %5
  store double 0.000000e+00, double addrspace(3)* %10, align 8, !tbaa !5
  %11 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_yo, i32 0, i32 %5
  store double 0.000000e+00, double addrspace(3)* %11, align 8, !tbaa !5
  %12 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE7s_hac_z, i32 0, i32 %5
  store double 0.000000e+00, double addrspace(3)* %12, align 8, !tbaa !5
  %13 = icmp slt i32 %1, -126
  br i1 %13, label %20, label %14

14:                                               ; preds = %4
  %15 = add nsw i32 %1, -1
  %16 = sdiv i32 %15, 128
  %17 = shl nsw i32 %1, 1
  %18 = mul nsw i32 %1, 3
  %19 = shl nsw i32 %1, 2
  br label %28

20:                                               ; preds = %96, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !9, !invariant.load !10
  %25 = icmp ult i16 %24, 2
  br i1 %25, label %104, label %26

26:                                               ; preds = %20
  %27 = zext i16 %24 to i32
  br label %106

28:                                               ; preds = %14, %96
  %29 = phi double [ 0.000000e+00, %14 ], [ %97, %96 ]
  %30 = phi double [ 0.000000e+00, %14 ], [ %98, %96 ]
  %31 = phi double [ 0.000000e+00, %14 ], [ %99, %96 ]
  %32 = phi double [ 0.000000e+00, %14 ], [ %100, %96 ]
  %33 = phi double [ 0.000000e+00, %14 ], [ %101, %96 ]
  %34 = phi i32 [ 0, %14 ], [ %102, %96 ]
  %35 = shl nsw i32 %34, 7
  %36 = add nuw nsw i32 %35, %5
  %37 = add nsw i32 %36, %6
  %38 = icmp slt i32 %37, %1
  br i1 %38, label %39, label %96

39:                                               ; preds = %28
  %40 = zext i32 %36 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !5, !amdgpu.noclobber !10
  %43 = sext i32 %37 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %2, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !5, !amdgpu.noclobber !10
  %46 = fmul contract double %42, %45
  %47 = add nsw i32 %37, %1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %2, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !5, !amdgpu.noclobber !10
  %51 = fmul contract double %42, %50
  %52 = fadd contract double %46, %51
  %53 = fadd contract double %33, %52
  store double %53, double addrspace(3)* %8, align 8, !tbaa !5
  %54 = add nsw i32 %36, %1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %2, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !5, !amdgpu.noclobber !10
  %58 = fmul contract double %50, %57
  %59 = fmul contract double %45, %57
  %60 = fadd contract double %58, %59
  %61 = fadd contract double %32, %60
  store double %61, double addrspace(3)* %9, align 8, !tbaa !5
  %62 = add nsw i32 %36, %17
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %2, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !5, !amdgpu.noclobber !10
  %66 = add nsw i32 %37, %17
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !5, !amdgpu.noclobber !10
  %70 = fmul contract double %65, %69
  %71 = add nsw i32 %37, %18
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %2, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !5, !amdgpu.noclobber !10
  %75 = fmul contract double %65, %74
  %76 = fadd contract double %70, %75
  %77 = fadd contract double %31, %76
  store double %77, double addrspace(3)* %10, align 8, !tbaa !5
  %78 = add nsw i32 %36, %18
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %2, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !5, !amdgpu.noclobber !10
  %82 = fmul contract double %74, %81
  %83 = fmul contract double %69, %81
  %84 = fadd contract double %82, %83
  %85 = fadd contract double %30, %84
  store double %85, double addrspace(3)* %11, align 8, !tbaa !5
  %86 = add nsw i32 %36, %19
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %2, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !5, !amdgpu.noclobber !10
  %90 = add nsw i32 %37, %19
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %2, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !5, !amdgpu.noclobber !10
  %94 = fmul contract double %89, %93
  %95 = fadd contract double %29, %94
  store double %95, double addrspace(3)* %12, align 8, !tbaa !5
  br label %96

96:                                               ; preds = %39, %28
  %97 = phi double [ %95, %39 ], [ %29, %28 ]
  %98 = phi double [ %85, %39 ], [ %30, %28 ]
  %99 = phi double [ %77, %39 ], [ %31, %28 ]
  %100 = phi double [ %61, %39 ], [ %32, %28 ]
  %101 = phi double [ %53, %39 ], [ %33, %28 ]
  %102 = add nuw nsw i32 %34, 1
  %103 = icmp eq i32 %34, %16
  br i1 %103, label %20, label %28, !llvm.loop !11

104:                                              ; preds = %132, %20
  %105 = icmp eq i32 %5, 0
  br i1 %105, label %134, label %163

106:                                              ; preds = %26, %132
  %107 = phi i32 [ %108, %132 ], [ %27, %26 ]
  %108 = lshr i32 %107, 1
  %109 = icmp ult i32 %5, %108
  br i1 %109, label %110, label %132

110:                                              ; preds = %106
  %111 = add nuw nsw i32 %108, %5
  %112 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_xi, i32 0, i32 %111
  %113 = load double, double addrspace(3)* %112, align 8, !tbaa !5
  %114 = load double, double addrspace(3)* %8, align 8, !tbaa !5
  %115 = fadd contract double %113, %114
  store double %115, double addrspace(3)* %8, align 8, !tbaa !5
  %116 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_xo, i32 0, i32 %111
  %117 = load double, double addrspace(3)* %116, align 8, !tbaa !5
  %118 = load double, double addrspace(3)* %9, align 8, !tbaa !5
  %119 = fadd contract double %117, %118
  store double %119, double addrspace(3)* %9, align 8, !tbaa !5
  %120 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_yi, i32 0, i32 %111
  %121 = load double, double addrspace(3)* %120, align 8, !tbaa !5
  %122 = load double, double addrspace(3)* %10, align 8, !tbaa !5
  %123 = fadd contract double %121, %122
  store double %123, double addrspace(3)* %10, align 8, !tbaa !5
  %124 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_yo, i32 0, i32 %111
  %125 = load double, double addrspace(3)* %124, align 8, !tbaa !5
  %126 = load double, double addrspace(3)* %11, align 8, !tbaa !5
  %127 = fadd contract double %125, %126
  store double %127, double addrspace(3)* %11, align 8, !tbaa !5
  %128 = getelementptr inbounds [128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE7s_hac_z, i32 0, i32 %111
  %129 = load double, double addrspace(3)* %128, align 8, !tbaa !5
  %130 = load double, double addrspace(3)* %12, align 8, !tbaa !5
  %131 = fadd contract double %129, %130
  store double %131, double addrspace(3)* %12, align 8, !tbaa !5
  br label %132

132:                                              ; preds = %110, %106
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = icmp ult i32 %107, 4
  br i1 %133, label %104, label %106, !llvm.loop !13

134:                                              ; preds = %104
  %135 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_xi, i32 0, i32 0), align 16, !tbaa !5
  %136 = sitofp i32 %7 to double
  %137 = fdiv contract double %135, %136
  %138 = sext i32 %6 to i64
  %139 = getelementptr inbounds double, double addrspace(1)* %3, i64 %138
  store double %137, double addrspace(1)* %139, align 8, !tbaa !5
  %140 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_xo, i32 0, i32 0), align 16, !tbaa !5
  %141 = fdiv contract double %140, %136
  %142 = add nsw i32 %6, %0
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double addrspace(1)* %3, i64 %143
  store double %141, double addrspace(1)* %144, align 8, !tbaa !5
  %145 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_yi, i32 0, i32 0), align 16, !tbaa !5
  %146 = fdiv contract double %145, %136
  %147 = shl nsw i32 %0, 1
  %148 = add nsw i32 %147, %6
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %3, i64 %149
  store double %146, double addrspace(1)* %150, align 8, !tbaa !5
  %151 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE8s_hac_yo, i32 0, i32 0), align 16, !tbaa !5
  %152 = fdiv contract double %151, %136
  %153 = mul nsw i32 %0, 3
  %154 = add nsw i32 %153, %6
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %3, i64 %155
  store double %152, double addrspace(1)* %156, align 8, !tbaa !5
  %157 = load double, double addrspace(3)* getelementptr inbounds ([128 x double], [128 x double] addrspace(3)* @_ZZ12gpu_find_haciiPKdPdE7s_hac_z, i32 0, i32 0), align 16, !tbaa !5
  %158 = fdiv contract double %157, %136
  %159 = shl nsw i32 %0, 2
  %160 = add nsw i32 %159, %6
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %3, i64 %161
  store double %158, double addrspace(1)* %162, align 8, !tbaa !5
  br label %163

163:                                              ; preds = %134, %104
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12, !14}
!14 = !{!"llvm.loop.unroll.enable"}
