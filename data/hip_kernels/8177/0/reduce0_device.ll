; ModuleID = '../data/hip_kernels/8177/0/main.cu'
source_filename = "../data/hip_kernels/8177/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce0PfS_S_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fmul contract float %15, %17
  %19 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp ult i16 %9, 2
  br i1 %20, label %21, label %23

21:                                               ; preds = %33, %3
  %22 = icmp eq i32 %4, 0
  br i1 %22, label %35, label %39

23:                                               ; preds = %3, %33
  %24 = phi i32 [ %25, %33 ], [ %10, %3 ]
  %25 = lshr i32 %24, 1
  %26 = icmp ult i32 %4, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = add nuw nsw i32 %25, %4
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !7
  %31 = load float, float addrspace(3)* %19, align 4, !tbaa !7
  %32 = fadd contract float %30, %31
  store float %32, float addrspace(3)* %19, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %27, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ult i32 %24, 4
  br i1 %34, label %21, label %23, !llvm.loop !11

35:                                               ; preds = %21
  %36 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %37 = zext i32 %5 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  store float %36, float addrspace(1)* %38, align 4, !tbaa !7
  br label %39

39:                                               ; preds = %35, %21
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
