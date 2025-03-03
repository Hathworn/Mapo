; ModuleID = '../data/hip_kernels/2694/3/main.cu'
source_filename = "../data/hip_kernels/2694/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17matrix_matrix_newPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = mul nsw i32 %4, %3
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %172

21:                                               ; preds = %6
  %22 = icmp sgt i32 %5, 0
  %23 = udiv i32 %16, %13
  %24 = mul i32 %23, %13
  %25 = icmp ugt i32 %16, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %13
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  %31 = and i32 %5, -8
  %32 = icmp eq i32 %29, 0
  br label %33

33:                                               ; preds = %21, %64
  %34 = phi i32 [ %18, %21 ], [ %68, %64 ]
  %35 = freeze i32 %34
  %36 = freeze i32 %4
  %37 = sdiv i32 %35, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %35, %38
  br i1 %22, label %40, label %64

40:                                               ; preds = %33
  %41 = mul nsw i32 %37, %5
  br i1 %30, label %42, label %70

42:                                               ; preds = %70, %40
  %43 = phi i32 [ undef, %40 ], [ %168, %70 ]
  %44 = phi i32 [ 0, %40 ], [ %169, %70 ]
  %45 = phi i32 [ 0, %40 ], [ %168, %70 ]
  br i1 %32, label %64, label %46

46:                                               ; preds = %42, %46
  %47 = phi i32 [ %61, %46 ], [ %44, %42 ]
  %48 = phi i32 [ %60, %46 ], [ %45, %42 ]
  %49 = phi i32 [ %62, %46 ], [ 0, %42 ]
  %50 = add nsw i32 %47, %41
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !16
  %54 = mul nsw i32 %47, %4
  %55 = add nsw i32 %54, %39
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !16
  %59 = mul nsw i32 %58, %53
  %60 = add nsw i32 %59, %48
  %61 = add nuw nsw i32 %47, 1
  %62 = add i32 %49, 1
  %63 = icmp eq i32 %62, %29
  br i1 %63, label %64, label %46, !llvm.loop !20

64:                                               ; preds = %42, %46, %33
  %65 = phi i32 [ 0, %33 ], [ %43, %42 ], [ %60, %46 ]
  %66 = sext i32 %34 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  store i32 %65, i32 addrspace(1)* %67, align 4, !tbaa !16
  %68 = add i32 %28, %34
  %69 = icmp slt i32 %68, %19
  br i1 %69, label %33, label %172, !llvm.loop !22

70:                                               ; preds = %40, %70
  %71 = phi i32 [ %169, %70 ], [ 0, %40 ]
  %72 = phi i32 [ %168, %70 ], [ 0, %40 ]
  %73 = phi i32 [ %170, %70 ], [ 0, %40 ]
  %74 = add nsw i32 %71, %41
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !16
  %78 = mul nsw i32 %71, %4
  %79 = add nsw i32 %78, %39
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !16
  %83 = mul nsw i32 %82, %77
  %84 = add nsw i32 %83, %72
  %85 = or i32 %71, 1
  %86 = add nsw i32 %85, %41
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !16
  %90 = mul nsw i32 %85, %4
  %91 = add nsw i32 %90, %39
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !16
  %95 = mul nsw i32 %94, %89
  %96 = add nsw i32 %95, %84
  %97 = or i32 %71, 2
  %98 = add nsw i32 %97, %41
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !16
  %102 = mul nsw i32 %97, %4
  %103 = add nsw i32 %102, %39
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !16
  %107 = mul nsw i32 %106, %101
  %108 = add nsw i32 %107, %96
  %109 = or i32 %71, 3
  %110 = add nsw i32 %109, %41
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !16
  %114 = mul nsw i32 %109, %4
  %115 = add nsw i32 %114, %39
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !16
  %119 = mul nsw i32 %118, %113
  %120 = add nsw i32 %119, %108
  %121 = or i32 %71, 4
  %122 = add nsw i32 %121, %41
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !16
  %126 = mul nsw i32 %121, %4
  %127 = add nsw i32 %126, %39
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !16
  %131 = mul nsw i32 %130, %125
  %132 = add nsw i32 %131, %120
  %133 = or i32 %71, 5
  %134 = add nsw i32 %133, %41
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %135
  %137 = load i32, i32 addrspace(1)* %136, align 4, !tbaa !16
  %138 = mul nsw i32 %133, %4
  %139 = add nsw i32 %138, %39
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !16
  %143 = mul nsw i32 %142, %137
  %144 = add nsw i32 %143, %132
  %145 = or i32 %71, 6
  %146 = add nsw i32 %145, %41
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %147
  %149 = load i32, i32 addrspace(1)* %148, align 4, !tbaa !16
  %150 = mul nsw i32 %145, %4
  %151 = add nsw i32 %150, %39
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !16
  %155 = mul nsw i32 %154, %149
  %156 = add nsw i32 %155, %144
  %157 = or i32 %71, 7
  %158 = add nsw i32 %157, %41
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %159
  %161 = load i32, i32 addrspace(1)* %160, align 4, !tbaa !16
  %162 = mul nsw i32 %157, %4
  %163 = add nsw i32 %162, %39
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %164
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !16
  %167 = mul nsw i32 %166, %161
  %168 = add nsw i32 %167, %156
  %169 = add nuw nsw i32 %71, 8
  %170 = add i32 %73, 8
  %171 = icmp eq i32 %170, %31
  br i1 %171, label %42, label %70, !llvm.loop !24

172:                                              ; preds = %64, %6
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
