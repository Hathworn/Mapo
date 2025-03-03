; ModuleID = '../data/hip_kernels/14977/0/main.cu'
source_filename = "../data/hip_kernels/14977/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12reduceKernelPfmjmE4temp = internal unnamed_addr addrspace(3) global [4 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12reduceKernelPfmjm(float addrspace(1)* nocapture %0, i64 %1, i32 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = shl nsw i32 %5, 2
  %8 = add nsw i32 %7, %6
  %9 = sext i32 %8 to i64
  %10 = icmp ult i64 %9, %1
  br i1 %10, label %11, label %16

11:                                               ; preds = %4
  %12 = mul i64 %9, %3
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ12reduceKernelPfmjmE4temp, i32 0, i32 %6
  store float %14, float addrspace(3)* %15, align 4, !tbaa !5
  br label %16

16:                                               ; preds = %11, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ12reduceKernelPfmjmE4temp, i32 0, i32 %6
  %18 = icmp ult i32 %6, 2
  br i1 %18, label %19, label %42

19:                                               ; preds = %16
  switch i32 %2, label %42 [
    i32 0, label %20
    i32 1, label %26
    i32 2, label %33
  ]

20:                                               ; preds = %19
  %21 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %22 = add nuw nsw i32 %6, 2
  %23 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ12reduceKernelPfmjmE4temp, i32 0, i32 %22
  %24 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %25 = fadd contract float %21, %24
  br label %40

26:                                               ; preds = %19
  %27 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %28 = add nuw nsw i32 %6, 2
  %29 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ12reduceKernelPfmjmE4temp, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %31 = fcmp contract olt float %27, %30
  %32 = select contract i1 %31, float %27, float %30
  br label %40

33:                                               ; preds = %19
  %34 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %35 = add nuw nsw i32 %6, 2
  %36 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ12reduceKernelPfmjmE4temp, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %38 = fcmp contract ogt float %34, %37
  %39 = select contract i1 %38, float %34, float %37
  br label %40

40:                                               ; preds = %33, %26, %20
  %41 = phi float [ %25, %20 ], [ %32, %26 ], [ %39, %33 ]
  store float %41, float addrspace(3)* %17, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %40, %19, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp eq i32 %6, 0
  br i1 %43, label %44, label %67

44:                                               ; preds = %42
  switch i32 %2, label %67 [
    i32 0, label %59
    i32 1, label %52
    i32 2, label %45
  ]

45:                                               ; preds = %44
  %46 = bitcast float addrspace(3)* %17 to <2 x float> addrspace(3)*
  %47 = load <2 x float>, <2 x float> addrspace(3)* %46, align 4, !tbaa !5
  %48 = extractelement <2 x float> %47, i64 0
  %49 = extractelement <2 x float> %47, i64 1
  %50 = fcmp contract ogt float %48, %49
  %51 = select contract i1 %50, float %48, float %49
  br label %65

52:                                               ; preds = %44
  %53 = bitcast float addrspace(3)* %17 to <2 x float> addrspace(3)*
  %54 = load <2 x float>, <2 x float> addrspace(3)* %53, align 4, !tbaa !5
  %55 = extractelement <2 x float> %54, i64 0
  %56 = extractelement <2 x float> %54, i64 1
  %57 = fcmp contract olt float %55, %56
  %58 = select contract i1 %57, float %55, float %56
  br label %65

59:                                               ; preds = %44
  %60 = bitcast float addrspace(3)* %17 to <2 x float> addrspace(3)*
  %61 = load <2 x float>, <2 x float> addrspace(3)* %60, align 4, !tbaa !5
  %62 = extractelement <2 x float> %61, i64 0
  %63 = extractelement <2 x float> %61, i64 1
  %64 = fadd contract float %62, %63
  br label %65

65:                                               ; preds = %45, %52, %59
  %66 = phi float [ %64, %59 ], [ %58, %52 ], [ %51, %45 ]
  store float %66, float addrspace(3)* %17, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %65, %44, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %10, label %68, label %72

68:                                               ; preds = %67
  %69 = load float, float addrspace(3)* getelementptr inbounds ([4 x float], [4 x float] addrspace(3)* @_ZZ12reduceKernelPfmjmE4temp, i32 0, i32 0), align 16, !tbaa !5
  %70 = sext i32 %7 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  store float %69, float addrspace(1)* %71, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %68, %67
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
