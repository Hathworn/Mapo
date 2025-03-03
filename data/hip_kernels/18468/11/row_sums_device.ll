; ModuleID = '../data/hip_kernels/18468/11/main.cu'
source_filename = "../data/hip_kernels/18468/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8row_sumsPKfPfmE5sdata = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8row_sumsPKfPfm(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = sext i32 %4 to i64
  %6 = icmp ult i64 %5, %2
  br i1 %6, label %7, label %56

7:                                                ; preds = %3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ8row_sumsPKfPfmE5sdata, i32 0, i32 %8
  store float 0.000000e+00, float addrspace(3)* %10, align 4, !tbaa !5
  %11 = icmp ult i64 %9, %2
  br i1 %11, label %14, label %12

12:                                               ; preds = %7
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br label %31

14:                                               ; preds = %7
  %15 = mul i64 %5, %2
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !9, !invariant.load !10
  %20 = zext i16 %19 to i64
  br label %21

21:                                               ; preds = %14, %21
  %22 = phi float [ 0.000000e+00, %14 ], [ %27, %21 ]
  %23 = phi i64 [ %9, %14 ], [ %28, %21 ]
  %24 = add i64 %23, %15
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !10
  %27 = fadd contract float %26, %22
  %28 = add i64 %23, %20
  %29 = icmp ult i64 %28, %2
  br i1 %29, label %21, label %30, !llvm.loop !11

30:                                               ; preds = %21
  store float %27, float addrspace(3)* %10, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %12, %30
  %32 = phi i8 addrspace(4)* [ %13, %12 ], [ %16, %30 ]
  %33 = getelementptr i8, i8 addrspace(4)* %32, i64 4
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !9, !invariant.load !10
  %36 = icmp ult i16 %35, 2
  br i1 %36, label %39, label %37

37:                                               ; preds = %31
  %38 = zext i16 %35 to i32
  br label %41

39:                                               ; preds = %51, %31
  %40 = icmp eq i32 %8, 0
  br i1 %40, label %53, label %56

41:                                               ; preds = %37, %51
  %42 = phi i32 [ %43, %51 ], [ %38, %37 ]
  %43 = lshr i32 %42, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ult i32 %8, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %41
  %46 = add nuw nsw i32 %43, %8
  %47 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ8row_sumsPKfPfmE5sdata, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %49 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %50 = fadd contract float %48, %49
  store float %50, float addrspace(3)* %10, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %41, %45
  %52 = icmp ult i32 %42, 4
  br i1 %52, label %39, label %41, !llvm.loop !13

53:                                               ; preds = %39
  %54 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ8row_sumsPKfPfmE5sdata, i32 0, i32 0), align 16, !tbaa !5
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %5
  store float %54, float addrspace(1)* %55, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %39, %53, %3
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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
