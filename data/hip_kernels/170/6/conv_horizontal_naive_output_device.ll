; ModuleID = '../data/hip_kernels/170/6/main.cu'
source_filename = "../data/hip_kernels/170/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28conv_horizontal_naive_outputiPfPKfS1_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %36

21:                                               ; preds = %7
  %22 = sub nsw i32 %5, %6
  %23 = add nsw i32 %22, 1
  %24 = mul nsw i32 %23, %4
  %25 = icmp sgt i32 %6, 0
  %26 = udiv i32 %16, %13
  %27 = mul i32 %26, %13
  %28 = icmp ugt i32 %16, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %13
  %32 = and i32 %6, 7
  %33 = icmp ult i32 %6, 8
  %34 = and i32 %6, -8
  %35 = icmp eq i32 %32, 0
  br label %37

36:                                               ; preds = %72, %7
  ret void

37:                                               ; preds = %21, %72
  %38 = phi i32 [ %19, %21 ], [ %73, %72 ]
  %39 = freeze i32 %38
  %40 = freeze i32 %23
  %41 = sdiv i32 %39, %40
  %42 = mul nsw i32 %41, %5
  %43 = mul i32 %41, %40
  %44 = sub i32 %39, %43
  %45 = add nsw i32 %42, %44
  %46 = sdiv i32 %38, %24
  %47 = mul nsw i32 %46, %6
  br i1 %25, label %48, label %72

48:                                               ; preds = %37
  %49 = sext i32 %38 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  br i1 %33, label %52, label %75

52:                                               ; preds = %75, %48
  %53 = phi float [ %51, %48 ], [ %165, %75 ]
  %54 = phi i32 [ 0, %48 ], [ %166, %75 ]
  br i1 %35, label %72, label %55

55:                                               ; preds = %52, %55
  %56 = phi float [ %68, %55 ], [ %53, %52 ]
  %57 = phi i32 [ %69, %55 ], [ %54, %52 ]
  %58 = phi i32 [ %70, %55 ], [ 0, %52 ]
  %59 = add nsw i32 %57, %47
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16
  %63 = add nsw i32 %45, %57
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fmul contract float %62, %66
  %68 = fadd contract float %56, %67
  store float %68, float addrspace(1)* %50, align 4, !tbaa !16
  %69 = add nuw nsw i32 %57, 1
  %70 = add i32 %58, 1
  %71 = icmp eq i32 %70, %32
  br i1 %71, label %72, label %55, !llvm.loop !20

72:                                               ; preds = %52, %55, %37
  %73 = add i32 %31, %38
  %74 = icmp slt i32 %73, %0
  br i1 %74, label %37, label %36, !llvm.loop !22

75:                                               ; preds = %48, %75
  %76 = phi float [ %165, %75 ], [ %51, %48 ]
  %77 = phi i32 [ %166, %75 ], [ 0, %48 ]
  %78 = phi i32 [ %167, %75 ], [ 0, %48 ]
  %79 = add nsw i32 %77, %47
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = add nsw i32 %45, %77
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fmul contract float %82, %86
  %88 = fadd contract float %76, %87
  store float %88, float addrspace(1)* %50, align 4, !tbaa !16
  %89 = or i32 %77, 1
  %90 = add nsw i32 %89, %47
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = add nsw i32 %45, %89
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fmul contract float %93, %97
  %99 = fadd contract float %88, %98
  store float %99, float addrspace(1)* %50, align 4, !tbaa !16
  %100 = or i32 %77, 2
  %101 = add nsw i32 %100, %47
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = add nsw i32 %45, %100
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = fmul contract float %104, %108
  %110 = fadd contract float %99, %109
  store float %110, float addrspace(1)* %50, align 4, !tbaa !16
  %111 = or i32 %77, 3
  %112 = add nsw i32 %111, %47
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %3, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = add nsw i32 %45, %111
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = fmul contract float %115, %119
  %121 = fadd contract float %110, %120
  store float %121, float addrspace(1)* %50, align 4, !tbaa !16
  %122 = or i32 %77, 4
  %123 = add nsw i32 %122, %47
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %3, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = add nsw i32 %45, %122
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = fmul contract float %126, %130
  %132 = fadd contract float %121, %131
  store float %132, float addrspace(1)* %50, align 4, !tbaa !16
  %133 = or i32 %77, 5
  %134 = add nsw i32 %133, %47
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16
  %138 = add nsw i32 %45, %133
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = fmul contract float %137, %141
  %143 = fadd contract float %132, %142
  store float %143, float addrspace(1)* %50, align 4, !tbaa !16
  %144 = or i32 %77, 6
  %145 = add nsw i32 %144, %47
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = add nsw i32 %45, %144
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !16
  %153 = fmul contract float %148, %152
  %154 = fadd contract float %143, %153
  store float %154, float addrspace(1)* %50, align 4, !tbaa !16
  %155 = or i32 %77, 7
  %156 = add nsw i32 %155, %47
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %3, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16
  %160 = add nsw i32 %45, %155
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = fmul contract float %159, %163
  %165 = fadd contract float %154, %164
  store float %165, float addrspace(1)* %50, align 4, !tbaa !16
  %166 = add nuw nsw i32 %77, 8
  %167 = add i32 %78, 8
  %168 = icmp eq i32 %167, %34
  br i1 %168, label %52, label %75, !llvm.loop !24
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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
