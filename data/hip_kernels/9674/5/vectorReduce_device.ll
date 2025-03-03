; ModuleID = '../data/hip_kernels/9674/5/main.cu'
source_filename = "../data/hip_kernels/9674/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12vectorReducePKfPfiE5sdata = internal unnamed_addr addrspace(3) global [10 x float] undef, align 16
@_ZZ12vectorReducePKfPfiE7sindice = internal unnamed_addr addrspace(3) global [10 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12vectorReducePKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds [10 x float], [10 x float] addrspace(3)* @_ZZ12vectorReducePKfPfiE5sdata, i32 0, i32 %4
  store float %15, float addrspace(3)* %16, align 4, !tbaa !7
  %17 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ12vectorReducePKfPfiE7sindice, i32 0, i32 %4
  store i32 %4, i32 addrspace(3)* %17, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp ult i16 %9, 2
  br i1 %18, label %19, label %20

19:                                               ; preds = %34, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %4, label %42 [
    i32 0, label %36
    i32 1, label %38
  ]

20:                                               ; preds = %3, %34
  %21 = phi i32 [ %22, %34 ], [ %10, %3 ]
  %22 = lshr i32 %21, 1
  %23 = icmp ult i32 %4, %22
  br i1 %23, label %24, label %34

24:                                               ; preds = %20
  %25 = load float, float addrspace(3)* %16, align 4, !tbaa !7
  %26 = add nuw nsw i32 %22, %4
  %27 = getelementptr inbounds [10 x float], [10 x float] addrspace(3)* @_ZZ12vectorReducePKfPfiE5sdata, i32 0, i32 %26
  %28 = load float, float addrspace(3)* %27, align 4, !tbaa !7
  %29 = fcmp contract ogt float %25, %28
  br i1 %29, label %30, label %33

30:                                               ; preds = %24
  store float %28, float addrspace(3)* %16, align 4, !tbaa !7
  %31 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(3)* @_ZZ12vectorReducePKfPfiE7sindice, i32 0, i32 %26
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !11
  store i32 %32, i32 addrspace(3)* %17, align 4, !tbaa !11
  br label %33

33:                                               ; preds = %30, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %34

34:                                               ; preds = %20, %33
  %35 = icmp ult i32 %21, 4
  br i1 %35, label %19, label %20, !llvm.loop !13

36:                                               ; preds = %19
  %37 = load float, float addrspace(3)* getelementptr inbounds ([10 x float], [10 x float] addrspace(3)* @_ZZ12vectorReducePKfPfiE5sdata, i32 0, i32 0), align 16, !tbaa !7
  store float %37, float addrspace(1)* %1, align 4, !tbaa !7
  br label %42

38:                                               ; preds = %19
  %39 = load i32, i32 addrspace(3)* getelementptr inbounds ([10 x i32], [10 x i32] addrspace(3)* @_ZZ12vectorReducePKfPfiE7sindice, i32 0, i32 0), align 16, !tbaa !11
  %40 = sitofp i32 %39 to float
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  store float %40, float addrspace(1)* %41, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %36, %19, %38
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
