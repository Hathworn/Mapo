; ModuleID = '../data/hip_kernels/831/0/main.cu'
source_filename = "../data/hip_kernels/831/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29kernel_prefix_sum_inefficientPdS_iE5sdata = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29kernel_prefix_sum_inefficientPdS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp ult i32 %12, %2
  %14 = icmp ne i32 %4, 0
  %15 = and i1 %14, %13
  br i1 %15, label %16, label %21

16:                                               ; preds = %3
  %17 = add i32 %12, -1
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 %18
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !6
  br label %21

21:                                               ; preds = %3, %16
  %22 = phi double [ %20, %16 ], [ 0.000000e+00, %3 ]
  %23 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ29kernel_prefix_sum_inefficientPdS_iE5sdata, i32 0, i32 %4
  store double %22, double addrspace(3)* %23, align 8
  %24 = icmp eq i32 %4, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %29, %21
  %26 = phi double [ %22, %21 ], [ %35, %29 ]
  %27 = zext i32 %12 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  store double %26, double addrspace(1)* %28, align 8, !tbaa !7
  ret void

29:                                               ; preds = %21, %29
  %30 = phi i32 [ %36, %29 ], [ 1, %21 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = sub i32 %4, %30
  %32 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ29kernel_prefix_sum_inefficientPdS_iE5sdata, i32 0, i32 %31
  %33 = load double, double addrspace(3)* %32, align 8, !tbaa !7
  %34 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %35 = fadd contract double %33, %34
  store double %35, double addrspace(3)* %23, align 8, !tbaa !7
  %36 = shl nuw nsw i32 %30, 1
  %37 = icmp ult i32 %4, %36
  br i1 %37, label %25, label %29, !llvm.loop !11
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
