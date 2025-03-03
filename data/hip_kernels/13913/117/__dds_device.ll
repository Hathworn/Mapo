; ModuleID = '../data/hip_kernels/13913/117/main.cu'
source_filename = "../data/hip_kernels/13913/117/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5__ddsiiPfS_PiS0_S_E5parts = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5__ddsiiPfS_PiS0_S_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = sext i32 %1 to i64
  %11 = mul nsw i64 %10, %9
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = zext i32 %24 to i64
  %26 = sdiv i64 %11, %25
  %27 = trunc i64 %26 to i32
  %28 = add i32 %8, 1
  %29 = zext i32 %28 to i64
  %30 = mul nsw i64 %10, %29
  %31 = sdiv i64 %30, %25
  %32 = trunc i64 %31 to i32
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %35 = mul nuw nsw i32 %34, %19
  %36 = add nuw nsw i32 %35, %33
  %37 = icmp slt i32 %27, %32
  br i1 %37, label %38, label %48

38:                                               ; preds = %7
  %39 = icmp slt i32 %36, %0
  %40 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %41 = bitcast i8 addrspace(4)* %40 to i16 addrspace(4)*
  %42 = load i16, i16 addrspace(4)* %41, align 2
  %43 = zext i16 %42 to i32
  %44 = mul nuw nsw i32 %43, %19
  %45 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ5__ddsiiPfS_PiS0_S_E5parts, i32 0, i32 %36
  %46 = icmp ugt i32 %44, 1
  %47 = icmp eq i32 %36, 0
  br label %49

48:                                               ; preds = %91, %7
  ret void

49:                                               ; preds = %38, %91
  %50 = phi i32 [ %27, %38 ], [ %92, %91 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !16
  %54 = mul nsw i32 %53, %0
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !16
  %57 = mul nsw i32 %56, %0
  br i1 %39, label %60, label %58

58:                                               ; preds = %60, %49
  %59 = phi float [ 0.000000e+00, %49 ], [ %72, %60 ]
  store float %59, float addrspace(3)* %45, align 4, !tbaa !20
  br i1 %46, label %76, label %75

60:                                               ; preds = %49, %60
  %61 = phi i32 [ %73, %60 ], [ %36, %49 ]
  %62 = phi float [ %72, %60 ], [ 0.000000e+00, %49 ]
  %63 = add nsw i32 %61, %54
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !20
  %67 = add nsw i32 %61, %57
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !20
  %71 = fmul contract float %66, %70
  %72 = fadd contract float %62, %71
  %73 = add i32 %44, %61
  %74 = icmp slt i32 %73, %0
  br i1 %74, label %60, label %58, !llvm.loop !22

75:                                               ; preds = %85, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %47, label %88, label %91

76:                                               ; preds = %58, %85
  %77 = phi i32 [ %86, %85 ], [ 1, %58 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = add nsw i32 %77, %36
  %79 = icmp ult i32 %78, %44
  br i1 %79, label %80, label %85

80:                                               ; preds = %76
  %81 = load float, float addrspace(3)* %45, align 4, !tbaa !20
  %82 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ5__ddsiiPfS_PiS0_S_E5parts, i32 0, i32 %78
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !20
  %84 = fadd contract float %81, %83
  store float %84, float addrspace(3)* %45, align 4, !tbaa !20
  br label %85

85:                                               ; preds = %76, %80
  %86 = shl nsw i32 %77, 1
  %87 = icmp ult i32 %86, %44
  br i1 %87, label %76, label %75, !llvm.loop !24

88:                                               ; preds = %75
  %89 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ5__ddsiiPfS_PiS0_S_E5parts, i32 0, i32 0), align 16, !tbaa !20
  %90 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  store float %89, float addrspace(1)* %90, align 4, !tbaa !20
  br label %91

91:                                               ; preds = %88, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = add nsw i32 %50, 1
  %93 = icmp slt i32 %92, %32
  br i1 %93, label %49, label %48, !llvm.loop !25
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
