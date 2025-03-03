; ModuleID = '../data/hip_kernels/7146/6/main.cu'
source_filename = "../data/hip_kernels/7146/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11kDot_m1_m2TiPKfS0_Pfii(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %32

20:                                               ; preds = %6
  %21 = icmp sgt i32 %4, 0
  %22 = udiv i32 %15, %12
  %23 = mul i32 %22, %12
  %24 = icmp ugt i32 %15, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %12
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %4, 8
  %30 = and i32 %4, -8
  %31 = icmp eq i32 %28, 0
  br label %33

32:                                               ; preds = %64, %6
  ret void

33:                                               ; preds = %20, %64
  %34 = phi i32 [ %18, %20 ], [ %68, %64 ]
  br i1 %21, label %35, label %64

35:                                               ; preds = %33
  %36 = freeze i32 %34
  %37 = freeze i32 %5
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  %41 = mul nsw i32 %40, %4
  %42 = mul nsw i32 %38, %4
  br i1 %29, label %43, label %70

43:                                               ; preds = %70, %35
  %44 = phi float [ undef, %35 ], [ %160, %70 ]
  %45 = phi i32 [ 0, %35 ], [ %161, %70 ]
  %46 = phi float [ 0.000000e+00, %35 ], [ %160, %70 ]
  br i1 %31, label %64, label %47

47:                                               ; preds = %43, %47
  %48 = phi i32 [ %61, %47 ], [ %45, %43 ]
  %49 = phi float [ %60, %47 ], [ %46, %43 ]
  %50 = phi i32 [ %62, %47 ], [ 0, %43 ]
  %51 = add nsw i32 %48, %41
  %52 = add nsw i32 %48, %42
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = sext i32 %51 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fmul contract float %55, %58
  %60 = fadd contract float %49, %59
  %61 = add nuw nsw i32 %48, 1
  %62 = add i32 %50, 1
  %63 = icmp eq i32 %62, %28
  br i1 %63, label %64, label %47, !llvm.loop !20

64:                                               ; preds = %43, %47, %33
  %65 = phi float [ 0.000000e+00, %33 ], [ %44, %43 ], [ %60, %47 ]
  %66 = sext i32 %34 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %66
  store float %65, float addrspace(1)* %67, align 4, !tbaa !16
  %68 = add i32 %27, %34
  %69 = icmp slt i32 %68, %0
  br i1 %69, label %33, label %32, !llvm.loop !22

70:                                               ; preds = %35, %70
  %71 = phi i32 [ %161, %70 ], [ 0, %35 ]
  %72 = phi float [ %160, %70 ], [ 0.000000e+00, %35 ]
  %73 = phi i32 [ %162, %70 ], [ 0, %35 ]
  %74 = add nsw i32 %71, %41
  %75 = add nsw i32 %71, %42
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = sext i32 %74 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = fmul contract float %78, %81
  %83 = fadd contract float %72, %82
  %84 = or i32 %71, 1
  %85 = add nsw i32 %84, %41
  %86 = add nsw i32 %84, %42
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = sext i32 %85 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = fmul contract float %89, %92
  %94 = fadd contract float %83, %93
  %95 = or i32 %71, 2
  %96 = add nsw i32 %95, %41
  %97 = add nsw i32 %95, %42
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = sext i32 %96 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fmul contract float %100, %103
  %105 = fadd contract float %94, %104
  %106 = or i32 %71, 3
  %107 = add nsw i32 %106, %41
  %108 = add nsw i32 %106, %42
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !16
  %112 = sext i32 %107 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fmul contract float %111, %114
  %116 = fadd contract float %105, %115
  %117 = or i32 %71, 4
  %118 = add nsw i32 %117, %41
  %119 = add nsw i32 %117, %42
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = sext i32 %118 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = fmul contract float %122, %125
  %127 = fadd contract float %116, %126
  %128 = or i32 %71, 5
  %129 = add nsw i32 %128, %41
  %130 = add nsw i32 %128, %42
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = sext i32 %129 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !16
  %137 = fmul contract float %133, %136
  %138 = fadd contract float %127, %137
  %139 = or i32 %71, 6
  %140 = add nsw i32 %139, %41
  %141 = add nsw i32 %139, %42
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %1, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !16
  %145 = sext i32 %140 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %2, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16
  %148 = fmul contract float %144, %147
  %149 = fadd contract float %138, %148
  %150 = or i32 %71, 7
  %151 = add nsw i32 %150, %41
  %152 = add nsw i32 %150, %42
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !16
  %156 = sext i32 %151 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %2, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !16
  %159 = fmul contract float %155, %158
  %160 = fadd contract float %149, %159
  %161 = add nuw nsw i32 %71, 8
  %162 = add i32 %73, 8
  %163 = icmp eq i32 %162, %30
  br i1 %163, label %43, label %70, !llvm.loop !24
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
