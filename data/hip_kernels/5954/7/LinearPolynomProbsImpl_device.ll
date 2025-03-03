; ModuleID = '../data/hip_kernels/5954/7/main.cu'
source_filename = "../data/hip_kernels/5954/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22LinearPolynomProbsImplPKfiPKiS0_S2_ifPfS2_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float %6, float addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp ult i32 %10, %1
  br i1 %11, label %12, label %152

12:                                               ; preds = %9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = zext i32 %10 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = getelementptr inbounds float, float addrspace(1)* %7, i64 %14
  %17 = icmp slt i32 %13, %5
  br i1 %17, label %18, label %152

18:                                               ; preds = %12
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !5
  %23 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !14, !invariant.load !15
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  br label %31

31:                                               ; preds = %18, %144
  %32 = phi i32 [ %13, %18 ], [ %150, %144 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !15
  %36 = add nsw i32 %32, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !15
  %40 = sub nsw i32 %39, %35
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %33
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !15
  %43 = icmp sgt i32 %40, 0
  br i1 %43, label %44, label %137

44:                                               ; preds = %31
  %45 = sext i32 %35 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  %48 = xor i32 %35, -1
  %49 = add i32 %39, %48
  %50 = and i32 %40, 3
  %51 = icmp ult i32 %49, 3
  br i1 %51, label %54, label %52

52:                                               ; preds = %44
  %53 = and i32 %40, -4
  br label %81

54:                                               ; preds = %132, %44
  %55 = phi i1 [ undef, %44 ], [ %133, %132 ]
  %56 = phi i32 [ 0, %44 ], [ %134, %132 ]
  %57 = phi i1 [ false, %44 ], [ %133, %132 ]
  %58 = icmp eq i32 %50, 0
  br i1 %58, label %79, label %59

59:                                               ; preds = %54, %74
  %60 = phi i32 [ %76, %74 ], [ %56, %54 ]
  %61 = phi i1 [ %75, %74 ], [ %57, %54 ]
  %62 = phi i32 [ %77, %74 ], [ 0, %54 ]
  br i1 %61, label %74, label %63

63:                                               ; preds = %59
  %64 = zext i32 %60 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %46, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !20
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %47, i64 %64
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !16, !amdgpu.noclobber !15
  %69 = mul nsw i32 %68, %1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %15, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !20
  %73 = fcmp contract ole float %72, %66
  br label %74

74:                                               ; preds = %63, %59
  %75 = phi i1 [ true, %59 ], [ %73, %63 ]
  %76 = add nuw nsw i32 %60, 1
  %77 = add i32 %62, 1
  %78 = icmp eq i32 %77, %50
  br i1 %78, label %79, label %59, !llvm.loop !22

79:                                               ; preds = %74, %54
  %80 = phi i1 [ %55, %54 ], [ %75, %74 ]
  br i1 %80, label %144, label %137

81:                                               ; preds = %132, %52
  %82 = phi i32 [ 0, %52 ], [ %134, %132 ]
  %83 = phi i1 [ false, %52 ], [ %133, %132 ]
  %84 = phi i32 [ 0, %52 ], [ %135, %132 ]
  br i1 %83, label %132, label %85

85:                                               ; preds = %81
  %86 = zext i32 %82 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %46, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !20
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %47, i64 %86
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !15
  %91 = mul nsw i32 %90, %1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %15, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !20
  %95 = fcmp contract ole float %94, %88
  br i1 %95, label %132, label %96

96:                                               ; preds = %85
  %97 = or i32 %82, 1
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %46, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !20
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %47, i64 %98
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !16, !amdgpu.noclobber !15
  %103 = mul nsw i32 %102, %1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %15, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !20
  %107 = fcmp contract ole float %106, %100
  br i1 %107, label %132, label %108

108:                                              ; preds = %96
  %109 = or i32 %82, 2
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %46, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !20
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %47, i64 %110
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !15
  %115 = mul nsw i32 %114, %1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %15, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !20
  %119 = fcmp contract ole float %118, %112
  br i1 %119, label %132, label %120

120:                                              ; preds = %108
  %121 = or i32 %82, 3
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %46, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !20
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %47, i64 %122
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !15
  %127 = mul nsw i32 %126, %1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %15, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !20
  %131 = fcmp contract ole float %130, %124
  br label %132

132:                                              ; preds = %96, %81, %85, %120, %108
  %133 = phi i1 [ true, %108 ], [ %131, %120 ], [ true, %85 ], [ true, %81 ], [ true, %96 ]
  %134 = add nuw nsw i32 %82, 4
  %135 = add i32 %84, 4
  %136 = icmp eq i32 %135, %53
  br i1 %136, label %54, label %81, !llvm.loop !24

137:                                              ; preds = %31, %79
  %138 = icmp eq i32 %42, -1
  br i1 %138, label %144, label %139

139:                                              ; preds = %137
  %140 = mul nsw i32 %42, %1
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %15, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !20
  br label %144

144:                                              ; preds = %137, %139, %79
  %145 = phi float [ 0.000000e+00, %79 ], [ %143, %139 ], [ 1.000000e+00, %137 ]
  %146 = mul nsw i32 %32, %1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %16, i64 %147
  store float %145, float addrspace(1)* %148, align 4, !tbaa !20
  %149 = add i32 %27, %32
  %150 = add i32 %149, %30
  %151 = icmp slt i32 %150, %5
  br i1 %151, label %31, label %152, !llvm.loop !26

152:                                              ; preds = %144, %12, %9
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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
