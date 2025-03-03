; ModuleID = '../data/hip_kernels/302/6/main.cu'
source_filename = "../data/hip_kernels/302/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z44kernel_vec_equals_vec1_plus_alpha_times_vec2PdS_dS_S_i(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double %2, double addrspace(1)* readonly %3, double addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add nsw i32 %14, %7
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %32

17:                                               ; preds = %6
  %18 = icmp eq double addrspace(1)* %3, addrspacecast (double* null to double addrspace(1)*)
  br i1 %18, label %22, label %19

19:                                               ; preds = %17
  %20 = load double, double addrspace(1)* %3, align 8, !tbaa !7, !amdgpu.noclobber !6
  %21 = fmul contract double %20, %2
  br label %22

22:                                               ; preds = %19, %17
  %23 = phi double [ %21, %19 ], [ %2, %17 ]
  %24 = sext i32 %15 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %1, i64 %24
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !7, !amdgpu.noclobber !6
  %27 = getelementptr inbounds double, double addrspace(1)* %4, i64 %24
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !6
  %29 = fmul contract double %23, %28
  %30 = fadd contract double %26, %29
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %24
  store double %30, double addrspace(1)* %31, align 8, !tbaa !7
  br label %32

32:                                               ; preds = %22, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
