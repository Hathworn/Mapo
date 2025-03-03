; ModuleID = '../data/hip_kernels/15405/14/main.cu'
source_filename = "../data/hip_kernels/15405/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18kernelFormBinStartPiPjjE5cache = internal unnamed_addr addrspace(3) global [257 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18kernelFormBinStartPiPjj(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %40

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = add nuw nsw i32 %11, 1
  %19 = getelementptr inbounds [257 x i32], [257 x i32] addrspace(3)* @_ZZ18kernelFormBinStartPiPjjE5cache, i32 0, i32 %18
  store i32 %17, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = icmp eq i32 %11, 0
  br i1 %20, label %21, label %30

21:                                               ; preds = %14
  %22 = icmp eq i32 %12, 0
  br i1 %22, label %28, label %23

23:                                               ; preds = %21
  %24 = add nsw i32 %12, -1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %28

28:                                               ; preds = %21, %23
  %29 = phi i32 [ %27, %23 ], [ -1, %21 ]
  store i32 %29, i32 addrspace(3)* getelementptr inbounds ([257 x i32], [257 x i32] addrspace(3)* @_ZZ18kernelFormBinStartPiPjjE5cache, i32 0, i32 0), align 16, !tbaa !7
  br label %30

30:                                               ; preds = %28, %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = getelementptr inbounds [257 x i32], [257 x i32] addrspace(3)* @_ZZ18kernelFormBinStartPiPjjE5cache, i32 0, i32 %11
  %32 = bitcast i32 addrspace(3)* %31 to <2 x i32> addrspace(3)*
  %33 = load <2 x i32>, <2 x i32> addrspace(3)* %32, align 4, !tbaa !7
  %34 = extractelement <2 x i32> %33, i64 0
  %35 = extractelement <2 x i32> %33, i64 1
  %36 = icmp eq i32 %35, %34
  br i1 %36, label %40, label %37

37:                                               ; preds = %30
  %38 = sext i32 %35 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  store i32 %12, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %30, %37, %3
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
