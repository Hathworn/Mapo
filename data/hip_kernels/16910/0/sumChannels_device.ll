; ModuleID = '../data/hip_kernels/16910/0/main.cu'
source_filename = "../data/hip_kernels/16910/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11sumChannelsPKdPKfPfPiPKi(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds double, double addrspace(1)* %0, i64 10
  %7 = load double, double addrspace(1)* %6, align 8, !tbaa !4, !amdgpu.noclobber !8
  %8 = fptosi double %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 13
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 14
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !10, !invariant.load !8
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !11
  %30 = mul i32 %10, %26
  %31 = add i32 %30, %9
  %32 = icmp slt i32 %31, %12
  br i1 %32, label %33, label %151

33:                                               ; preds = %5
  %34 = icmp sgt i32 %15, 0
  %35 = icmp sgt i32 %21, 0
  %36 = icmp sgt i32 %18, 0
  %37 = udiv i32 %29, %26
  %38 = mul i32 %37, %26
  %39 = icmp ugt i32 %29, %38
  %40 = zext i1 %39 to i32
  %41 = add i32 %37, %40
  %42 = mul i32 %41, %26
  %43 = and i32 %18, 1
  %44 = icmp eq i32 %18, 1
  %45 = and i32 %18, -2
  %46 = icmp eq i32 %43, 0
  br label %47

47:                                               ; preds = %33, %148
  %48 = phi i32 [ %31, %33 ], [ %149, %148 ]
  br i1 %34, label %49, label %148

49:                                               ; preds = %47, %138
  %50 = phi i32 [ %146, %138 ], [ 0, %47 ]
  br i1 %35, label %51, label %138

51:                                               ; preds = %49
  %52 = mul nsw i32 %50, %8
  br label %53

53:                                               ; preds = %51, %133
  %54 = phi float [ 0.000000e+00, %51 ], [ %135, %133 ]
  %55 = phi i32 [ 0, %51 ], [ %136, %133 ]
  %56 = phi i32 [ 0, %51 ], [ %134, %133 ]
  br i1 %36, label %57, label %133

57:                                               ; preds = %53
  %58 = mul i32 %55, %15
  %59 = mul nsw i32 %55, %18
  br i1 %44, label %106, label %60

60:                                               ; preds = %57, %60
  %61 = phi float [ %103, %60 ], [ %54, %57 ]
  %62 = phi float [ %95, %60 ], [ 0.000000e+00, %57 ]
  %63 = phi i32 [ %102, %60 ], [ %56, %57 ]
  %64 = phi i32 [ %97, %60 ], [ 0, %57 ]
  %65 = phi i32 [ %104, %60 ], [ 0, %57 ]
  %66 = add nsw i32 %64, %52
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !20
  %70 = add i32 %69, %58
  %71 = mul i32 %70, %12
  %72 = add i32 %71, %48
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !22
  %76 = fadd contract float %62, %75
  %77 = fmul contract float %76, %76
  %78 = or i32 %64, 1
  %79 = sitofp i32 %78 to float
  %80 = fdiv contract float %77, %79
  %81 = fcmp contract ogt float %80, %61
  %82 = add nsw i32 %64, %59
  %83 = select i1 %81, i32 %82, i32 %63
  %84 = select i1 %81, float %80, float %61
  %85 = add nsw i32 %78, %52
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !20
  %89 = add i32 %88, %58
  %90 = mul i32 %89, %12
  %91 = add i32 %90, %48
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !22
  %95 = fadd contract float %76, %94
  %96 = fmul contract float %95, %95
  %97 = add nuw nsw i32 %64, 2
  %98 = sitofp i32 %97 to float
  %99 = fdiv contract float %96, %98
  %100 = fcmp contract ogt float %99, %84
  %101 = add nsw i32 %78, %59
  %102 = select i1 %100, i32 %101, i32 %83
  %103 = select i1 %100, float %99, float %84
  %104 = add i32 %65, 2
  %105 = icmp eq i32 %104, %45
  br i1 %105, label %106, label %60, !llvm.loop !24

106:                                              ; preds = %60, %57
  %107 = phi i32 [ undef, %57 ], [ %102, %60 ]
  %108 = phi float [ undef, %57 ], [ %103, %60 ]
  %109 = phi float [ %54, %57 ], [ %103, %60 ]
  %110 = phi float [ 0.000000e+00, %57 ], [ %95, %60 ]
  %111 = phi i32 [ %56, %57 ], [ %102, %60 ]
  %112 = phi i32 [ 0, %57 ], [ %97, %60 ]
  br i1 %46, label %133, label %113

113:                                              ; preds = %106
  %114 = add nsw i32 %112, %52
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !20
  %118 = add i32 %117, %58
  %119 = mul i32 %118, %12
  %120 = add i32 %119, %48
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !22
  %124 = fadd contract float %110, %123
  %125 = fmul contract float %124, %124
  %126 = add nuw nsw i32 %112, 1
  %127 = sitofp i32 %126 to float
  %128 = fdiv contract float %125, %127
  %129 = fcmp contract ogt float %128, %109
  %130 = add nsw i32 %112, %59
  %131 = select i1 %129, i32 %130, i32 %111
  %132 = select i1 %129, float %128, float %109
  br label %133

133:                                              ; preds = %113, %106, %53
  %134 = phi i32 [ %56, %53 ], [ %107, %106 ], [ %131, %113 ]
  %135 = phi float [ %54, %53 ], [ %108, %106 ], [ %132, %113 ]
  %136 = add nuw nsw i32 %55, 1
  %137 = icmp eq i32 %136, %21
  br i1 %137, label %138, label %53, !llvm.loop !26

138:                                              ; preds = %133, %49
  %139 = phi i32 [ 0, %49 ], [ %134, %133 ]
  %140 = phi float [ 0.000000e+00, %49 ], [ %135, %133 ]
  %141 = mul nsw i32 %50, %12
  %142 = add nsw i32 %141, %48
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %2, i64 %143
  store float %140, float addrspace(1)* %144, align 4, !tbaa !22
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %143
  store i32 %139, i32 addrspace(1)* %145, align 4, !tbaa !20
  %146 = add nuw nsw i32 %50, 1
  %147 = icmp eq i32 %146, %15
  br i1 %147, label %148, label %49, !llvm.loop !27

148:                                              ; preds = %138, %47
  %149 = add i32 %42, %48
  %150 = icmp slt i32 %149, %12
  br i1 %150, label %47, label %151, !llvm.loop !28

151:                                              ; preds = %148, %5
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
!26 = distinct !{!26, !25}
!27 = distinct !{!27, !25}
!28 = distinct !{!28, !25}
