; ModuleID = '../data/hip_kernels/17576/7/main.cu'
source_filename = "../data/hip_kernels/17576/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29create_FF_full_FoXS_surf_gradPfS_fPiS_S_iiiiE5FF_pt = internal unnamed_addr addrspace(3) global [7 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29create_FF_full_FoXS_surf_gradPfS_fPiS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp sgt i32 %11, %6
  br i1 %12, label %35, label %13

13:                                               ; preds = %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = icmp sgt i32 %14, %7
  %16 = add nsw i32 %7, 1
  %17 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ29create_FF_full_FoXS_surf_gradPfS_fPiS_S_iiiiE5FF_pt, i32 0, i32 %7
  %21 = icmp slt i32 %14, %8
  %22 = icmp eq i32 %14, 0
  %23 = add i32 %8, 1
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !4
  %27 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %26, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %26, %30
  %32 = zext i1 %31 to i32
  %33 = zext i16 %27 to i32
  %34 = zext i16 %27 to i32
  br label %36

35:                                               ; preds = %111, %10
  ret void

36:                                               ; preds = %13, %111
  %37 = phi i32 [ %11, %13 ], [ %113, %111 ]
  %38 = icmp sge i32 %37, %6
  %39 = select i1 %38, i1 true, i1 %15
  br i1 %39, label %51, label %40

40:                                               ; preds = %36
  %41 = mul nsw i32 %37, %16
  br label %42

42:                                               ; preds = %40, %42
  %43 = phi i32 [ %14, %40 ], [ %49, %42 ]
  %44 = add nsw i32 %43, %41
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !15
  %48 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ29create_FF_full_FoXS_surf_gradPfS_fPiS_S_iiiiE5FF_pt, i32 0, i32 %43
  store float %47, float addrspace(3)* %48, align 4, !tbaa !15
  %49 = add i32 %43, %33
  %50 = icmp sgt i32 %49, %7
  br i1 %50, label %51, label %42, !llvm.loop !19

51:                                               ; preds = %42, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = load float, float addrspace(3)* %20, align 4, !tbaa !15
  %53 = fmul contract float %52, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp eq i32 %37, %6
  br i1 %54, label %55, label %75

55:                                               ; preds = %51
  br i1 %21, label %56, label %104

56:                                               ; preds = %55, %56
  %57 = phi i32 [ %73, %56 ], [ %14, %55 ]
  %58 = mul nsw i32 %57, 3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %5, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !15
  %62 = fmul contract float %61, %2
  store float %62, float addrspace(1)* %60, align 4, !tbaa !15
  %63 = add nsw i32 %58, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %5, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !15
  %67 = fmul contract float %66, %2
  store float %67, float addrspace(1)* %65, align 4, !tbaa !15
  %68 = add nsw i32 %58, 2
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %5, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !15
  %72 = fmul contract float %71, %2
  store float %72, float addrspace(1)* %70, align 4, !tbaa !15
  %73 = add i32 %57, %28
  %74 = icmp slt i32 %73, %8
  br i1 %74, label %56, label %104, !llvm.loop !21

75:                                               ; preds = %51
  br i1 %21, label %76, label %104

76:                                               ; preds = %75
  %77 = mul nsw i32 %37, %9
  %78 = load float, float addrspace(3)* getelementptr inbounds ([7 x float], [7 x float] addrspace(3)* @_ZZ29create_FF_full_FoXS_surf_gradPfS_fPiS_S_iiiiE5FF_pt, i32 0, i32 0), align 16
  br label %79

79:                                               ; preds = %76, %95
  %80 = phi i32 [ %14, %76 ], [ %102, %95 ]
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !22
  %84 = icmp sgt i32 %83, 5
  br i1 %84, label %85, label %89

85:                                               ; preds = %79
  %86 = add nsw i32 %80, %77
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %87
  store float %78, float addrspace(1)* %88, align 4, !tbaa !15
  br label %95

89:                                               ; preds = %79
  %90 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ29create_FF_full_FoXS_surf_gradPfS_fPiS_S_iiiiE5FF_pt, i32 0, i32 %83
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !15
  %92 = add nsw i32 %80, %77
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %93
  store float %91, float addrspace(1)* %94, align 4, !tbaa !15
  br label %95

95:                                               ; preds = %89, %85
  %96 = phi float [ %91, %89 ], [ %78, %85 ]
  %97 = phi float addrspace(1)* [ %94, %89 ], [ %88, %85 ]
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !15
  %100 = fmul contract float %53, %99
  %101 = fadd contract float %96, %100
  store float %101, float addrspace(1)* %97, align 4, !tbaa !15
  %102 = add i32 %80, %34
  %103 = icmp slt i32 %102, %8
  br i1 %103, label %79, label %104, !llvm.loop !24

104:                                              ; preds = %95, %56, %75, %55
  br i1 %22, label %105, label %111

105:                                              ; preds = %104
  %106 = load float, float addrspace(3)* %20, align 4, !tbaa !15
  %107 = mul nsw i32 %37, %9
  %108 = add i32 %23, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  store float %106, float addrspace(1)* %110, align 4, !tbaa !15
  br label %111

111:                                              ; preds = %104, %105
  %112 = add i32 %29, %37
  %113 = add i32 %112, %32
  %114 = icmp sgt i32 %113, %6
  br i1 %114, label %35, label %36, !llvm.loop !25
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !17, i64 0}
!24 = distinct !{!24, !20}
!25 = distinct !{!25, !20}
