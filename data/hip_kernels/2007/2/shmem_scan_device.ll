; ModuleID = '../data/hip_kernels/2007/2/main.cu'
source_filename = "../data/hip_kernels/2007/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10shmem_scanPfS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds float, float addrspace(1)* %1, i64 %4
  %6 = load float, float addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %3
  store float %6, float addrspace(3)* %7, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %8 = icmp eq i32 %3, 0
  br i1 %8, label %17, label %9

9:                                                ; preds = %2
  %10 = add nsw i32 %3, -1
  %11 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %10
  %12 = bitcast float addrspace(3)* %11 to <2 x float> addrspace(3)*
  %13 = load <2 x float>, <2 x float> addrspace(3)* %12, align 4, !tbaa !5
  %14 = extractelement <2 x float> %13, i64 0
  %15 = extractelement <2 x float> %13, i64 1
  %16 = fadd contract float %15, %14
  br label %17

17:                                               ; preds = %9, %2
  %18 = phi float [ %16, %9 ], [ 0.000000e+00, %2 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %8, label %20, label %19

19:                                               ; preds = %17
  store float %18, float addrspace(3)* %7, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %17, %19
  %21 = phi float [ 0.000000e+00, %19 ], [ %18, %17 ]
  %22 = icmp ugt i32 %3, 1
  br i1 %22, label %23, label %29

23:                                               ; preds = %20
  %24 = add nsw i32 %3, -2
  %25 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %26 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %24
  %27 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %28 = fadd contract float %25, %27
  br label %29

29:                                               ; preds = %23, %20
  %30 = phi float [ %28, %23 ], [ %21, %20 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %31, label %32

31:                                               ; preds = %29
  store float %30, float addrspace(3)* %7, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %31, %29
  %33 = phi float [ 0.000000e+00, %31 ], [ %30, %29 ]
  %34 = icmp ugt i32 %3, 3
  br i1 %34, label %35, label %41

35:                                               ; preds = %32
  %36 = add nsw i32 %3, -4
  %37 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  %38 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %36
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %40 = fadd contract float %37, %39
  br label %41

41:                                               ; preds = %35, %32
  %42 = phi float [ %40, %35 ], [ %33, %32 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %45, label %43

43:                                               ; preds = %41
  %44 = load float, float addrspace(3)* %7, align 4, !tbaa !5
  br label %46

45:                                               ; preds = %41
  store float %42, float addrspace(3)* %7, align 4, !tbaa !5
  br label %46

46:                                               ; preds = %43, %45
  %47 = phi float [ %44, %43 ], [ %42, %45 ]
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %4
  store float %47, float addrspace(1)* %48, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
