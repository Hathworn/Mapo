; ModuleID = '../data/hip_kernels/300/25/main.cu'
source_filename = "../data/hip_kernels/300/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9subsamplePfS_S_S_iiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = sub nsw i32 %6, %8
  %13 = sdiv i32 %12, %10
  %14 = add nsw i32 %13, 1
  %15 = sub nsw i32 %5, %7
  %16 = sdiv i32 %15, %9
  %17 = add nsw i32 %16, 1
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = urem i32 %18, %4
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !5, !invariant.load !6
  %30 = zext i16 %29 to i32
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 16
  %32 = bitcast i8 addrspace(4)* %31 to i32 addrspace(4)*
  %33 = load i32, i32 addrspace(4)* %32, align 8, !tbaa !7
  %34 = mul i32 %26, %30
  %35 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %36 = add i32 %34, %35
  %37 = udiv i32 %33, %30
  %38 = mul i32 %37, %30
  %39 = icmp ugt i32 %33, %38
  %40 = zext i1 %39 to i32
  %41 = add i32 %37, %40
  %42 = mul i32 %41, %30
  %43 = mul nsw i32 %14, %18
  %44 = mul nsw i32 %43, %17
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = mul i32 %18, %5
  %48 = mul i32 %47, %6
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = sext i32 %19 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !6
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !6
  %56 = icmp sgt i32 %36, %16
  br i1 %56, label %164, label %57

57:                                               ; preds = %11
  %58 = icmp sgt i32 %20, %13
  %59 = mul i32 %9, %6
  %60 = icmp sgt i32 %7, 0
  %61 = icmp sgt i32 %8, 0
  %62 = sext i32 %6 to i64
  %63 = and i32 %8, 7
  %64 = icmp ult i32 %8, 8
  %65 = and i32 %8, -8
  %66 = icmp eq i32 %63, 0
  br label %67

67:                                               ; preds = %57, %161
  %68 = phi i32 [ %36, %57 ], [ %162, %161 ]
  br i1 %58, label %161, label %69

69:                                               ; preds = %67
  %70 = mul i32 %59, %68
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %50, i64 %71
  %73 = mul nsw i32 %68, %14
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %46, i64 %74
  br label %76

76:                                               ; preds = %69, %155
  %77 = phi i32 [ %20, %69 ], [ %159, %155 ]
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %75, i64 %78
  br i1 %60, label %80, label %155

80:                                               ; preds = %76
  %81 = mul nsw i32 %77, %10
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %72, i64 %82
  br label %84

84:                                               ; preds = %80, %150
  %85 = phi i32 [ %153, %150 ], [ 0, %80 ]
  %86 = phi float [ %151, %150 ], [ 0.000000e+00, %80 ]
  %87 = phi float addrspace(1)* [ %152, %150 ], [ %83, %80 ]
  br i1 %61, label %88, label %150

88:                                               ; preds = %84
  br i1 %64, label %135, label %89

89:                                               ; preds = %88, %89
  %90 = phi i32 [ %132, %89 ], [ 0, %88 ]
  %91 = phi float [ %131, %89 ], [ %86, %88 ]
  %92 = phi i32 [ %133, %89 ], [ 0, %88 ]
  %93 = zext i32 %90 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %87, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = fadd contract float %91, %95
  %97 = or i32 %90, 1
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %87, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fadd contract float %96, %100
  %102 = or i32 %90, 2
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %87, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16
  %106 = fadd contract float %101, %105
  %107 = or i32 %90, 3
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %87, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fadd contract float %106, %110
  %112 = or i32 %90, 4
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %87, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = fadd contract float %111, %115
  %117 = or i32 %90, 5
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %87, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fadd contract float %116, %120
  %122 = or i32 %90, 6
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %87, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = fadd contract float %121, %125
  %127 = or i32 %90, 7
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %87, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = fadd contract float %126, %130
  %132 = add nuw nsw i32 %90, 8
  %133 = add i32 %92, 8
  %134 = icmp eq i32 %133, %65
  br i1 %134, label %135, label %89, !llvm.loop !20

135:                                              ; preds = %89, %88
  %136 = phi float [ undef, %88 ], [ %131, %89 ]
  %137 = phi i32 [ 0, %88 ], [ %132, %89 ]
  %138 = phi float [ %86, %88 ], [ %131, %89 ]
  br i1 %66, label %150, label %139

139:                                              ; preds = %135, %139
  %140 = phi i32 [ %147, %139 ], [ %137, %135 ]
  %141 = phi float [ %146, %139 ], [ %138, %135 ]
  %142 = phi i32 [ %148, %139 ], [ 0, %135 ]
  %143 = zext i32 %140 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %87, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16
  %146 = fadd contract float %141, %145
  %147 = add nuw nsw i32 %140, 1
  %148 = add i32 %142, 1
  %149 = icmp eq i32 %148, %63
  br i1 %149, label %150, label %139, !llvm.loop !22

150:                                              ; preds = %135, %139, %84
  %151 = phi float [ %86, %84 ], [ %136, %135 ], [ %146, %139 ]
  %152 = getelementptr inbounds float, float addrspace(1)* %87, i64 %62
  %153 = add nuw nsw i32 %85, 1
  %154 = icmp eq i32 %153, %7
  br i1 %154, label %155, label %84, !llvm.loop !24

155:                                              ; preds = %150, %76
  %156 = phi float [ 0.000000e+00, %76 ], [ %151, %150 ]
  %157 = fmul contract float %53, %156
  %158 = fadd contract float %55, %157
  store float %158, float addrspace(1)* %79, align 4, !tbaa !16
  %159 = add nuw nsw i32 %77, %25
  %160 = icmp sgt i32 %159, %13
  br i1 %160, label %161, label %76, !llvm.loop !25

161:                                              ; preds = %155, %67
  %162 = add nsw i32 %68, %42
  %163 = icmp sgt i32 %162, %16
  br i1 %163, label %164, label %67, !llvm.loop !26

164:                                              ; preds = %161, %11
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
