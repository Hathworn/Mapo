; ModuleID = '../data/hip_kernels/1083/16/main.cu'
source_filename = "../data/hip_kernels/1083/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13set_coords_3DPfmmm(float addrspace(1)* nocapture writeonly %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = zext i32 %13 to i64
  %15 = mul i64 %3, %2
  %16 = mul i64 %15, %1
  %17 = icmp ugt i64 %16, %14
  br i1 %17, label %18, label %52

18:                                               ; preds = %4
  %19 = udiv i64 %14, %15
  %20 = freeze i64 %14
  %21 = freeze i64 %3
  %22 = udiv i64 %20, %21
  %23 = urem i64 %22, %2
  %24 = mul i64 %22, %21
  %25 = sub i64 %20, %24
  %26 = uitofp i64 %19 to double
  %27 = uitofp i64 %1 to float
  %28 = fpext float %27 to double
  %29 = fmul contract double %28, 5.000000e-01
  %30 = fsub contract double %26, %29
  %31 = fptrunc double %30 to float
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  store float %31, float addrspace(1)* %32, align 4, !tbaa !7
  %33 = uitofp i64 %23 to double
  %34 = uitofp i64 %2 to float
  %35 = fpext float %34 to double
  %36 = fmul contract double %35, 5.000000e-01
  %37 = fsub contract double %33, %36
  %38 = fptrunc double %37 to float
  %39 = add i64 %16, %14
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float %38, float addrspace(1)* %40, align 4, !tbaa !7
  %41 = uitofp i64 %25 to double
  %42 = uitofp i64 %3 to float
  %43 = fpext float %42 to double
  %44 = fmul contract double %43, 5.000000e-01
  %45 = fsub contract double %41, %44
  %46 = fptrunc double %45 to float
  %47 = shl i64 %1, 1
  %48 = mul i64 %47, %2
  %49 = mul i64 %48, %3
  %50 = add i64 %49, %14
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float %46, float addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %18, %4
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
