; ModuleID = '../data/hip_kernels/1083/15/main.cu'
source_filename = "../data/hip_kernels/1083/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13set_coords_2DPfmm(float addrspace(1)* nocapture writeonly %0, i64 %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = zext i32 %12 to i64
  %14 = freeze i64 %13
  %15 = freeze i64 %2
  %16 = udiv i64 %14, %15
  %17 = mul i64 %16, %15
  %18 = sub i64 %14, %17
  %19 = mul i64 %2, %1
  %20 = icmp ugt i64 %19, %13
  br i1 %20, label %21, label %39

21:                                               ; preds = %3
  %22 = uitofp i64 %16 to double
  %23 = uitofp i64 %1 to float
  %24 = fpext float %23 to double
  %25 = fmul contract double %24, 5.000000e-01
  %26 = fsub contract double %22, %25
  %27 = fptrunc double %26 to float
  %28 = mul i64 %16, %2
  %29 = add i64 %28, %18
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float %27, float addrspace(1)* %30, align 4, !tbaa !7
  %31 = uitofp i64 %18 to double
  %32 = uitofp i64 %2 to float
  %33 = fpext float %32 to double
  %34 = fmul contract double %33, 5.000000e-01
  %35 = fsub contract double %31, %34
  %36 = fptrunc double %35 to float
  %37 = add i64 %29, %19
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  store float %36, float addrspace(1)* %38, align 4, !tbaa !7
  br label %39

39:                                               ; preds = %21, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
