; ModuleID = '../data/hip_kernels/930/6/main.cu'
source_filename = "../data/hip_kernels/930/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z33CorrelateDataBackward1Subtract_1diiiiiiiiiiiiiiiiiiiPKfS0_PfS0_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, float addrspace(1)* nocapture readonly %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture writeonly %21, float addrspace(1)* nocapture readonly %22) local_unnamed_addr #0 {
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
  %39 = add nsw i32 %8, %7
  %40 = icmp sgt i32 %8, 0
  %41 = mul i32 %9, -2
  %42 = sub i32 %38, %6
  %43 = add nsw i32 %42, -1
  %44 = add i32 %43, %41
  %45 = add nsw i32 %38, -1
  %46 = add i32 %45, %41
  %47 = add nsw i32 %3, -1
  %48 = add nsw i32 %4, -1
  %49 = mul nsw i32 %15, %2
  %50 = mul nsw i32 %5, %2
  %51 = sub i32 %50, %7
  %52 = shl nsw i32 %9, 1
  %53 = add nuw nsw i32 %52, 1
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

64:                                               ; preds = %95, %23
  ret void

65:                                               ; preds = %37, %95
  %66 = phi i32 [ %35, %37 ], [ %101, %95 ]
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
  br i1 %40, label %78, label %95

78:                                               ; preds = %65
  %79 = add i32 %44, %72
  %80 = add i32 %46, %76
  %81 = sdiv i32 %80, %10
  %82 = add nsw i32 %81, -49999
  %83 = add nsw i32 %76, %38
  %84 = sdiv i32 %83, %10
  %85 = add nsw i32 %84, -50000
  %86 = icmp sgt i32 %84, 49999
  %87 = icmp slt i32 %82, %4
  %88 = tail call i32 @llvm.smax.i32(i32 %82, i32 0)
  %89 = tail call i32 @llvm.smin.i32(i32 %48, i32 %85)
  %90 = add nsw i32 %76, %49
  %91 = mul nsw i32 %90, %14
  %92 = add i32 %91, %72
  %93 = icmp sgt i32 %88, %89
  %94 = add i32 %38, %72
  br label %103

95:                                               ; preds = %157, %65
  %96 = phi float [ 0.000000e+00, %65 ], [ %158, %157 ]
  %97 = fdiv contract float %96, %56
  %98 = add nsw i32 %66, %57
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %21, i64 %99
  store float %97, float addrspace(1)* %100, align 4, !tbaa !16
  %101 = add i32 %63, %66
  %102 = icmp slt i32 %101, %0
  br i1 %102, label %65, label %64, !llvm.loop !20

103:                                              ; preds = %78, %157
  %104 = phi float [ 0.000000e+00, %78 ], [ %158, %157 ]
  %105 = phi i32 [ %7, %78 ], [ %159, %157 ]
  %106 = mul i32 %105, %11
  %107 = sub i32 %79, %106
  %108 = sdiv i32 %107, %10
  %109 = add nsw i32 %108, -49999
  %110 = add i32 %106, %6
  %111 = sub i32 %94, %110
  %112 = sdiv i32 %111, %10
  %113 = icmp sgt i32 %112, 49999
  %114 = select i1 %113, i1 %86, i1 false
  %115 = icmp slt i32 %109, %3
  %116 = select i1 %114, i1 %115, i1 false
  %117 = select i1 %116, i1 %87, i1 false
  br i1 %117, label %118, label %157

118:                                              ; preds = %103
  %119 = add nsw i32 %112, -50000
  %120 = tail call i32 @llvm.smax.i32(i32 %109, i32 0)
  %121 = tail call i32 @llvm.smin.i32(i32 %47, i32 %119)
  %122 = sub i32 %92, %106
  %123 = mul nsw i32 %122, %16
  %124 = add nsw i32 %123, %77
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %19, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = getelementptr inbounds float, float addrspace(1)* %20, i64 %125
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !16
  %130 = fcmp contract oge float %127, %129
  br i1 %93, label %157, label %131

131:                                              ; preds = %118
  %132 = add i32 %51, %105
  %133 = icmp sgt i32 %120, %121
  %134 = mul nsw i32 %132, %4
  br label %135

135:                                              ; preds = %131, %141
  %136 = phi i32 [ %88, %131 ], [ %143, %141 ]
  %137 = phi float [ %104, %131 ], [ %142, %141 ]
  br i1 %133, label %141, label %138

138:                                              ; preds = %135
  %139 = add nsw i32 %136, %134
  %140 = mul nsw i32 %139, %3
  br label %145

141:                                              ; preds = %145, %135
  %142 = phi float [ %137, %135 ], [ %154, %145 ]
  %143 = add nuw nsw i32 %136, 1
  %144 = icmp slt i32 %136, %89
  br i1 %144, label %135, label %157, !llvm.loop !22

145:                                              ; preds = %138, %145
  %146 = phi i32 [ %120, %138 ], [ %155, %145 ]
  %147 = phi float [ %137, %138 ], [ %154, %145 ]
  %148 = add nsw i32 %146, %140
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %22, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16
  %152 = fneg contract float %151
  %153 = select contract i1 %130, float %152, float %151
  %154 = fadd contract float %147, %153
  %155 = add nuw nsw i32 %146, 1
  %156 = icmp slt i32 %146, %121
  br i1 %156, label %145, label %141, !llvm.loop !23

157:                                              ; preds = %141, %118, %103
  %158 = phi float [ %104, %103 ], [ %104, %118 ], [ %142, %141 ]
  %159 = add nsw i32 %105, 1
  %160 = icmp slt i32 %159, %39
  br i1 %160, label %103, label %95, !llvm.loop !24
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
