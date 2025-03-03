; ModuleID = '../data/hip_kernels/7146/7/main.cu'
source_filename = "../data/hip_kernels/7146/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11kDot_m1T_m2iPKfS0_Pfiii(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %20, label %21, label %33

21:                                               ; preds = %7
  %22 = icmp sgt i32 %4, 0
  %23 = udiv i32 %16, %13
  %24 = mul i32 %23, %13
  %25 = icmp ugt i32 %16, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %13
  %29 = and i32 %4, 7
  %30 = icmp ult i32 %4, 8
  %31 = and i32 %4, -8
  %32 = icmp eq i32 %29, 0
  br label %34

33:                                               ; preds = %65, %7
  ret void

34:                                               ; preds = %21, %65
  %35 = phi i32 [ %19, %21 ], [ %71, %65 ]
  %36 = freeze i32 %35
  %37 = freeze i32 %6
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  br i1 %22, label %41, label %65

41:                                               ; preds = %34
  br i1 %30, label %42, label %73

42:                                               ; preds = %73, %41
  %43 = phi float [ undef, %41 ], [ %179, %73 ]
  %44 = phi i32 [ 0, %41 ], [ %180, %73 ]
  %45 = phi float [ 0.000000e+00, %41 ], [ %179, %73 ]
  br i1 %32, label %65, label %46

46:                                               ; preds = %42, %46
  %47 = phi i32 [ %62, %46 ], [ %44, %42 ]
  %48 = phi float [ %61, %46 ], [ %45, %42 ]
  %49 = phi i32 [ %63, %46 ], [ 0, %42 ]
  %50 = mul nsw i32 %47, %5
  %51 = add nsw i32 %50, %38
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = mul nsw i32 %47, %6
  %56 = add nsw i32 %55, %40
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fmul contract float %54, %59
  %61 = fadd contract float %48, %60
  %62 = add nuw nsw i32 %47, 1
  %63 = add i32 %49, 1
  %64 = icmp eq i32 %63, %29
  br i1 %64, label %65, label %46, !llvm.loop !20

65:                                               ; preds = %42, %46, %34
  %66 = phi float [ 0.000000e+00, %34 ], [ %43, %42 ], [ %61, %46 ]
  %67 = sext i32 %35 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fadd contract float %66, %69
  store float %70, float addrspace(1)* %68, align 4, !tbaa !16
  %71 = add i32 %28, %35
  %72 = icmp slt i32 %71, %0
  br i1 %72, label %34, label %33, !llvm.loop !22

73:                                               ; preds = %41, %73
  %74 = phi i32 [ %180, %73 ], [ 0, %41 ]
  %75 = phi float [ %179, %73 ], [ 0.000000e+00, %41 ]
  %76 = phi i32 [ %181, %73 ], [ 0, %41 ]
  %77 = mul nsw i32 %74, %5
  %78 = add nsw i32 %77, %38
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = mul nsw i32 %74, %6
  %83 = add nsw i32 %82, %40
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %75, %87
  %89 = or i32 %74, 1
  %90 = mul nsw i32 %89, %5
  %91 = add nsw i32 %90, %38
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = mul nsw i32 %89, %6
  %96 = add nsw i32 %95, %40
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = fmul contract float %94, %99
  %101 = fadd contract float %88, %100
  %102 = or i32 %74, 2
  %103 = mul nsw i32 %102, %5
  %104 = add nsw i32 %103, %38
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = mul nsw i32 %102, %6
  %109 = add nsw i32 %108, %40
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fmul contract float %107, %112
  %114 = fadd contract float %101, %113
  %115 = or i32 %74, 3
  %116 = mul nsw i32 %115, %5
  %117 = add nsw i32 %116, %38
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = mul nsw i32 %115, %6
  %122 = add nsw i32 %121, %40
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = fmul contract float %120, %125
  %127 = fadd contract float %114, %126
  %128 = or i32 %74, 4
  %129 = mul nsw i32 %128, %5
  %130 = add nsw i32 %129, %38
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = mul nsw i32 %128, %6
  %135 = add nsw i32 %134, %40
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %2, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = fmul contract float %133, %138
  %140 = fadd contract float %127, %139
  %141 = or i32 %74, 5
  %142 = mul nsw i32 %141, %5
  %143 = add nsw i32 %142, %38
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = mul nsw i32 %141, %6
  %148 = add nsw i32 %147, %40
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16
  %152 = fmul contract float %146, %151
  %153 = fadd contract float %140, %152
  %154 = or i32 %74, 6
  %155 = mul nsw i32 %154, %5
  %156 = add nsw i32 %155, %38
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16
  %160 = mul nsw i32 %154, %6
  %161 = add nsw i32 %160, %40
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %2, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !16
  %165 = fmul contract float %159, %164
  %166 = fadd contract float %153, %165
  %167 = or i32 %74, 7
  %168 = mul nsw i32 %167, %5
  %169 = add nsw i32 %168, %38
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !16
  %173 = mul nsw i32 %167, %6
  %174 = add nsw i32 %173, %40
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !16
  %178 = fmul contract float %172, %177
  %179 = fadd contract float %166, %178
  %180 = add nuw nsw i32 %74, 8
  %181 = add i32 %76, 8
  %182 = icmp eq i32 %181, %31
  br i1 %182, label %42, label %73, !llvm.loop !24
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
