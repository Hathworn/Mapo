; ModuleID = '../data/hip_kernels/7058/3/main.cu'
source_filename = "../data/hip_kernels/7058/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9reductionPiS_E7s_array = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9reductionPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !5
  %15 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ9reductionPiS_E7s_array, i32 0, i32 %10
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = icmp ult i16 %7, 2
  br i1 %16, label %17, label %19

17:                                               ; preds = %29, %2
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %31, label %35

19:                                               ; preds = %2, %29
  %20 = phi i32 [ %21, %29 ], [ %8, %2 ]
  %21 = lshr i32 %20, 1
  %22 = icmp ult i32 %10, %21
  br i1 %22, label %23, label %29

23:                                               ; preds = %19
  %24 = add nuw nsw i32 %21, %10
  %25 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ9reductionPiS_E7s_array, i32 0, i32 %24
  %26 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !7
  %27 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %28 = add nsw i32 %27, %26
  store i32 %28, i32 addrspace(3)* %15, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %23, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i32 %20, 4
  br i1 %30, label %17, label %19, !llvm.loop !11

31:                                               ; preds = %17
  %32 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ9reductionPiS_E7s_array, i32 0, i32 0), align 16, !tbaa !7
  %33 = zext i32 %3 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  store i32 %32, i32 addrspace(1)* %34, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %31, %17
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
