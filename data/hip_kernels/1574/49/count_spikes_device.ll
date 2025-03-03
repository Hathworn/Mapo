; ModuleID = '../data/hip_kernels/1574/49/main.cu'
source_filename = "../data/hip_kernels/1574/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12count_spikesPKdPKiPiPKfPf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %7 = fptosi double %6 to i32
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !10, !invariant.load !8
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !11
  %21 = mul i32 %12, %17
  %22 = udiv i32 %20, %17
  %23 = add nsw i32 %21, %11
  %24 = icmp slt i32 %23, %10
  br i1 %24, label %25, label %125

25:                                               ; preds = %5
  %26 = mul i32 %22, %17
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %22, %28
  %30 = icmp sgt i32 %7, 0
  %31 = mul nsw i32 %29, %17
  %32 = and i32 %7, 3
  %33 = icmp ult i32 %7, 4
  %34 = and i32 %7, -4
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %25, %115
  %37 = phi i32 [ %23, %25 ], [ %123, %115 ]
  %38 = sext i32 %37 to i64
  br i1 %30, label %39, label %115

39:                                               ; preds = %36
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  br i1 %33, label %96, label %43

43:                                               ; preds = %39, %92
  %44 = phi i32 [ %93, %92 ], [ 0, %39 ]
  %45 = phi i32 [ %94, %92 ], [ 0, %39 ]
  %46 = zext i32 %44 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !20
  %49 = icmp eq i32 %48, %37
  br i1 %49, label %50, label %56

50:                                               ; preds = %43
  %51 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !20
  %52 = add nsw i32 %51, 1
  store i32 %52, i32 addrspace(1)* %40, align 4, !tbaa !20
  %53 = load float, float addrspace(1)* %41, align 4, !tbaa !22
  %54 = load float, float addrspace(1)* %42, align 4, !tbaa !22
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(1)* %42, align 4, !tbaa !22
  br label %56

56:                                               ; preds = %43, %50
  %57 = or i32 %44, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !20
  %61 = icmp eq i32 %60, %37
  br i1 %61, label %62, label %68

62:                                               ; preds = %56
  %63 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !20
  %64 = add nsw i32 %63, 1
  store i32 %64, i32 addrspace(1)* %40, align 4, !tbaa !20
  %65 = load float, float addrspace(1)* %41, align 4, !tbaa !22
  %66 = load float, float addrspace(1)* %42, align 4, !tbaa !22
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(1)* %42, align 4, !tbaa !22
  br label %68

68:                                               ; preds = %62, %56
  %69 = or i32 %44, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !20
  %73 = icmp eq i32 %72, %37
  br i1 %73, label %74, label %80

74:                                               ; preds = %68
  %75 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !20
  %76 = add nsw i32 %75, 1
  store i32 %76, i32 addrspace(1)* %40, align 4, !tbaa !20
  %77 = load float, float addrspace(1)* %41, align 4, !tbaa !22
  %78 = load float, float addrspace(1)* %42, align 4, !tbaa !22
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(1)* %42, align 4, !tbaa !22
  br label %80

80:                                               ; preds = %74, %68
  %81 = or i32 %44, 3
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !20
  %85 = icmp eq i32 %84, %37
  br i1 %85, label %86, label %92

86:                                               ; preds = %80
  %87 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !20
  %88 = add nsw i32 %87, 1
  store i32 %88, i32 addrspace(1)* %40, align 4, !tbaa !20
  %89 = load float, float addrspace(1)* %41, align 4, !tbaa !22
  %90 = load float, float addrspace(1)* %42, align 4, !tbaa !22
  %91 = fadd contract float %89, %90
  store float %91, float addrspace(1)* %42, align 4, !tbaa !22
  br label %92

92:                                               ; preds = %86, %80
  %93 = add nuw nsw i32 %44, 4
  %94 = add i32 %45, 4
  %95 = icmp eq i32 %94, %34
  br i1 %95, label %96, label %43, !llvm.loop !24

96:                                               ; preds = %92, %39
  %97 = phi i32 [ 0, %39 ], [ %93, %92 ]
  br i1 %35, label %115, label %98

98:                                               ; preds = %96, %111
  %99 = phi i32 [ %112, %111 ], [ %97, %96 ]
  %100 = phi i32 [ %113, %111 ], [ 0, %96 ]
  %101 = zext i32 %99 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !20
  %104 = icmp eq i32 %103, %37
  br i1 %104, label %105, label %111

105:                                              ; preds = %98
  %106 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !20
  %107 = add nsw i32 %106, 1
  store i32 %107, i32 addrspace(1)* %40, align 4, !tbaa !20
  %108 = load float, float addrspace(1)* %41, align 4, !tbaa !22
  %109 = load float, float addrspace(1)* %42, align 4, !tbaa !22
  %110 = fadd contract float %108, %109
  store float %110, float addrspace(1)* %42, align 4, !tbaa !22
  br label %111

111:                                              ; preds = %105, %98
  %112 = add nuw nsw i32 %99, 1
  %113 = add i32 %100, 1
  %114 = icmp eq i32 %113, %32
  br i1 %114, label %115, label %98, !llvm.loop !26

115:                                              ; preds = %96, %111, %36
  %116 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !22
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !20
  %120 = sitofp i32 %119 to float
  %121 = fadd contract float %120, 0x3F50624DE0000000
  %122 = fdiv contract float %117, %121
  store float %122, float addrspace(1)* %116, align 4, !tbaa !22
  %123 = add nsw i32 %37, %31
  %124 = icmp slt i32 %123, %10
  br i1 %124, label %36, label %125, !llvm.loop !28

125:                                              ; preds = %115, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !6, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !6, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
!28 = distinct !{!28, !25}
