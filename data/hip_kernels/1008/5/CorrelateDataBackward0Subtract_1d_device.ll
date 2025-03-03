; ModuleID = '../data/hip_kernels/1008/5/main.cu'
source_filename = "../data/hip_kernels/1008/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z33CorrelateDataBackward0Subtract_1diiiiiiiiiiiiiiiiiiiPfPKfS1_S1_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, float addrspace(1)* nocapture writeonly %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture readonly %21, float addrspace(1)* nocapture readonly %22) local_unnamed_addr #0 {
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !4, !invariant.load !5
  %29 = zext i16 %28 to i32
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %31 = bitcast i8 addrspace(4)* %30 to i32 addrspace(4)*
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !6
  %33 = mul i32 %24, %29
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %34
  %36 = icmp slt i32 %35, %0
  br i1 %36, label %37, label %64

37:                                               ; preds = %23
  %38 = mul nsw i32 %10, 50000
  %39 = shl nsw i32 %9, 1
  %40 = add i32 %39, %6
  %41 = sub i32 %38, %40
  %42 = add nsw i32 %41, -1
  %43 = sub i32 %38, %39
  %44 = add nsw i32 %43, -1
  %45 = sub i32 %38, %6
  %46 = add nsw i32 %3, -1
  %47 = add nsw i32 %4, -1
  %48 = add nsw i32 %8, %7
  %49 = icmp sgt i32 %8, 0
  %50 = mul nsw i32 %15, %2
  %51 = mul nsw i32 %5, %2
  %52 = sub i32 %51, %7
  %53 = add nuw nsw i32 %39, 1
  %54 = mul nsw i32 %53, %53
  %55 = mul nsw i32 %54, %16
  %56 = sitofp i32 %55 to float
  %57 = mul nsw i32 %17, %2
  %58 = udiv i32 %32, %29
  %59 = mul i32 %58, %29
  %60 = icmp ugt i32 %32, %59
  %61 = zext i1 %60 to i32
  %62 = add i32 %58, %61
  %63 = mul i32 %62, %29
  br label %65

64:                                               ; preds = %150, %23
  ret void

65:                                               ; preds = %37, %150
  %66 = phi i32 [ %35, %37 ], [ %156, %150 ]
  %67 = freeze i32 %66
  %68 = freeze i32 %12
  %69 = sdiv i32 %67, %68
  %70 = mul i32 %69, %68
  %71 = sub i32 %67, %70
  %72 = add nsw i32 %71, %18
  %73 = freeze i32 %13
  %74 = sdiv i32 %69, %73
  %75 = mul i32 %74, %73
  %76 = sub i32 %69, %75
  %77 = srem i32 %74, %16
  %78 = add i32 %42, %72
  %79 = sdiv i32 %78, %10
  %80 = add nsw i32 %79, -49999
  %81 = add i32 %44, %76
  %82 = sdiv i32 %81, %10
  %83 = add nsw i32 %82, -49999
  %84 = add i32 %45, %72
  %85 = sdiv i32 %84, %10
  %86 = add nsw i32 %85, -50000
  %87 = add nsw i32 %76, %38
  %88 = sdiv i32 %87, %10
  %89 = add nsw i32 %88, -50000
  %90 = icmp sgt i32 %85, 49999
  %91 = icmp sgt i32 %88, 49999
  %92 = select i1 %90, i1 %91, i1 false
  br i1 %92, label %93, label %150

93:                                               ; preds = %65
  %94 = icmp slt i32 %80, %3
  %95 = icmp slt i32 %83, %4
  %96 = select i1 %94, i1 %95, i1 false
  br i1 %96, label %97, label %150

97:                                               ; preds = %93
  %98 = tail call i32 @llvm.smax.i32(i32 %80, i32 0)
  %99 = tail call i32 @llvm.smin.i32(i32 %46, i32 %86)
  %100 = tail call i32 @llvm.smax.i32(i32 %83, i32 0)
  %101 = tail call i32 @llvm.smin.i32(i32 %47, i32 %89)
  br i1 %49, label %102, label %150

102:                                              ; preds = %97
  %103 = add nsw i32 %76, %50
  %104 = mul nsw i32 %103, %14
  %105 = add i32 %104, %72
  %106 = icmp sgt i32 %100, %101
  %107 = icmp sgt i32 %98, %99
  br label %108

108:                                              ; preds = %102, %130
  %109 = phi float [ 0.000000e+00, %102 ], [ %131, %130 ]
  %110 = phi i32 [ %7, %102 ], [ %132, %130 ]
  %111 = mul nsw i32 %110, %11
  %112 = add i32 %105, %111
  %113 = mul nsw i32 %112, %16
  %114 = add nsw i32 %113, %77
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %20, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = getelementptr inbounds float, float addrspace(1)* %21, i64 %115
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fcmp contract oge float %117, %119
  br i1 %106, label %130, label %121

121:                                              ; preds = %108
  %122 = add i32 %52, %110
  %123 = mul nsw i32 %122, %4
  br label %124

124:                                              ; preds = %121, %134
  %125 = phi i32 [ %100, %121 ], [ %136, %134 ]
  %126 = phi float [ %109, %121 ], [ %135, %134 ]
  br i1 %107, label %134, label %127

127:                                              ; preds = %124
  %128 = add nsw i32 %125, %123
  %129 = mul nsw i32 %128, %3
  br label %138

130:                                              ; preds = %134, %108
  %131 = phi float [ %109, %108 ], [ %135, %134 ]
  %132 = add nsw i32 %110, 1
  %133 = icmp slt i32 %132, %48
  br i1 %133, label %108, label %150, !llvm.loop !20

134:                                              ; preds = %138, %124
  %135 = phi float [ %126, %124 ], [ %147, %138 ]
  %136 = add nuw nsw i32 %125, 1
  %137 = icmp slt i32 %125, %101
  br i1 %137, label %124, label %130, !llvm.loop !22

138:                                              ; preds = %127, %138
  %139 = phi i32 [ %98, %127 ], [ %148, %138 ]
  %140 = phi float [ %126, %127 ], [ %147, %138 ]
  %141 = add nsw i32 %139, %129
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %22, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16
  %145 = fneg contract float %144
  %146 = select contract i1 %120, float %144, float %145
  %147 = fadd contract float %140, %146
  %148 = add nuw nsw i32 %139, 1
  %149 = icmp slt i32 %139, %99
  br i1 %149, label %138, label %134, !llvm.loop !23

150:                                              ; preds = %130, %97, %93, %65
  %151 = phi float [ 0.000000e+00, %93 ], [ 0.000000e+00, %65 ], [ 0.000000e+00, %97 ], [ %131, %130 ]
  %152 = fdiv contract float %151, %56
  %153 = add nsw i32 %66, %57
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %19, i64 %154
  store float %152, float addrspace(1)* %155, align 4, !tbaa !16
  %156 = add i32 %63, %66
  %157 = icmp slt i32 %156, %0
  br i1 %157, label %65, label %64, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
