; ModuleID = '../data/hip_kernels/14592/28/main.cu'
source_filename = "../data/hip_kernels/14592/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9subsamplePfS_iiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = sub nsw i32 %4, %6
  %11 = sdiv i32 %10, %8
  %12 = add nsw i32 %11, 1
  %13 = sub nsw i32 %3, %5
  %14 = sdiv i32 %13, %7
  %15 = add nsw i32 %14, 1
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 16
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 8, !tbaa !7
  %31 = mul i32 %23, %27
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %33 = add i32 %31, %32
  %34 = udiv i32 %30, %27
  %35 = mul i32 %34, %27
  %36 = icmp ugt i32 %30, %35
  %37 = zext i1 %36 to i32
  %38 = add i32 %34, %37
  %39 = mul i32 %38, %27
  %40 = mul nsw i32 %12, %16
  %41 = mul nsw i32 %40, %15
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %44 = mul i32 %16, %3
  %45 = mul i32 %44, %4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = icmp sgt i32 %33, %14
  br i1 %48, label %157, label %49

49:                                               ; preds = %9
  %50 = icmp sgt i32 %17, %11
  %51 = mul i32 %7, %4
  %52 = icmp sgt i32 %5, 0
  %53 = icmp sgt i32 %6, 0
  %54 = sext i32 %4 to i64
  %55 = mul nsw i32 %6, %5
  %56 = sitofp i32 %55 to float
  %57 = and i32 %6, 7
  %58 = icmp ult i32 %6, 8
  %59 = and i32 %6, -8
  %60 = icmp eq i32 %57, 0
  br label %61

61:                                               ; preds = %49, %154
  %62 = phi i32 [ %33, %49 ], [ %155, %154 ]
  br i1 %50, label %154, label %63

63:                                               ; preds = %61
  %64 = mul i32 %51, %62
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %47, i64 %65
  %67 = mul nsw i32 %62, %12
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %43, i64 %68
  br label %70

70:                                               ; preds = %63, %149
  %71 = phi i32 [ %17, %63 ], [ %152, %149 ]
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %69, i64 %72
  br i1 %52, label %74, label %149

74:                                               ; preds = %70
  %75 = mul nsw i32 %71, %8
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %66, i64 %76
  br label %78

78:                                               ; preds = %74, %144
  %79 = phi i32 [ %147, %144 ], [ 0, %74 ]
  %80 = phi float [ %145, %144 ], [ 0.000000e+00, %74 ]
  %81 = phi float addrspace(1)* [ %146, %144 ], [ %77, %74 ]
  br i1 %53, label %82, label %144

82:                                               ; preds = %78
  br i1 %58, label %129, label %83

83:                                               ; preds = %82, %83
  %84 = phi i32 [ %126, %83 ], [ 0, %82 ]
  %85 = phi float [ %125, %83 ], [ %80, %82 ]
  %86 = phi i32 [ %127, %83 ], [ 0, %82 ]
  %87 = zext i32 %84 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %81, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fadd contract float %85, %89
  %91 = or i32 %84, 1
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %81, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = fadd contract float %90, %94
  %96 = or i32 %84, 2
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %81, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = fadd contract float %95, %99
  %101 = or i32 %84, 3
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %81, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fadd contract float %100, %104
  %106 = or i32 %84, 4
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %81, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %110 = fadd contract float %105, %109
  %111 = or i32 %84, 5
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %81, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fadd contract float %110, %114
  %116 = or i32 %84, 6
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %81, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fadd contract float %115, %119
  %121 = or i32 %84, 7
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %81, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fadd contract float %120, %124
  %126 = add nuw nsw i32 %84, 8
  %127 = add i32 %86, 8
  %128 = icmp eq i32 %127, %59
  br i1 %128, label %129, label %83, !llvm.loop !20

129:                                              ; preds = %83, %82
  %130 = phi float [ undef, %82 ], [ %125, %83 ]
  %131 = phi i32 [ 0, %82 ], [ %126, %83 ]
  %132 = phi float [ %80, %82 ], [ %125, %83 ]
  br i1 %60, label %144, label %133

133:                                              ; preds = %129, %133
  %134 = phi i32 [ %141, %133 ], [ %131, %129 ]
  %135 = phi float [ %140, %133 ], [ %132, %129 ]
  %136 = phi i32 [ %142, %133 ], [ 0, %129 ]
  %137 = zext i32 %134 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %81, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fadd contract float %135, %139
  %141 = add nuw nsw i32 %134, 1
  %142 = add i32 %136, 1
  %143 = icmp eq i32 %142, %57
  br i1 %143, label %144, label %133, !llvm.loop !22

144:                                              ; preds = %129, %133, %78
  %145 = phi float [ %80, %78 ], [ %130, %129 ], [ %140, %133 ]
  %146 = getelementptr inbounds float, float addrspace(1)* %81, i64 %54
  %147 = add nuw nsw i32 %79, 1
  %148 = icmp eq i32 %147, %5
  br i1 %148, label %149, label %78, !llvm.loop !24

149:                                              ; preds = %144, %70
  %150 = phi float [ 0.000000e+00, %70 ], [ %145, %144 ]
  %151 = fdiv contract float %150, %56
  store float %151, float addrspace(1)* %73, align 4, !tbaa !16
  %152 = add nuw nsw i32 %71, %22
  %153 = icmp sgt i32 %152, %11
  br i1 %153, label %154, label %70, !llvm.loop !25

154:                                              ; preds = %149, %61
  %155 = add nsw i32 %62, %39
  %156 = icmp sgt i32 %155, %14
  br i1 %156, label %157, label %61, !llvm.loop !26

157:                                              ; preds = %154, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 16}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
