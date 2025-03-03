; ModuleID = '../data/hip_kernels/324/153/main.cu'
source_filename = "../data/hip_kernels/324/153/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18kAccumulateColumnsPfS_S_iiifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, float %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = mul i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = add i32 %23, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = icmp slt i32 %25, %5
  %28 = icmp slt i32 %26, %4
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %157

30:                                               ; preds = %8
  %31 = icmp eq i32 %3, 0
  br i1 %31, label %68, label %32

32:                                               ; preds = %30
  %33 = and i32 %3, 3
  %34 = icmp ult i32 %3, 4
  br i1 %34, label %37, label %35

35:                                               ; preds = %32
  %36 = and i32 %3, -4
  br label %82

37:                                               ; preds = %151, %32
  %38 = phi float [ undef, %32 ], [ %153, %151 ]
  %39 = phi i32 [ undef, %32 ], [ %144, %151 ]
  %40 = phi i32 [ 0, %32 ], [ %154, %151 ]
  %41 = phi i32 [ 0, %32 ], [ %144, %151 ]
  %42 = phi float [ 0.000000e+00, %32 ], [ %153, %151 ]
  %43 = icmp eq i32 %33, 0
  br i1 %43, label %68, label %44

44:                                               ; preds = %37, %62
  %45 = phi i32 [ %65, %62 ], [ %40, %37 ]
  %46 = phi i32 [ %55, %62 ], [ %41, %37 ]
  %47 = phi float [ %64, %62 ], [ %42, %37 ]
  %48 = phi i32 [ %66, %62 ], [ 0, %37 ]
  %49 = zext i32 %45 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16, !amdgpu.noclobber !14
  %52 = fptosi float %51 to i32
  %53 = icmp eq i32 %26, %52
  %54 = zext i1 %53 to i32
  %55 = add i32 %46, %54
  br i1 %53, label %56, label %62

56:                                               ; preds = %44
  %57 = mul i32 %45, %5
  %58 = add i32 %57, %25
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %62

62:                                               ; preds = %56, %44
  %63 = phi contract float [ %61, %56 ], [ 0.000000e+00, %44 ]
  %64 = fadd contract float %47, %63
  %65 = add nuw i32 %45, 1
  %66 = add i32 %48, 1
  %67 = icmp eq i32 %66, %33
  br i1 %67, label %68, label %44, !llvm.loop !20

68:                                               ; preds = %37, %62, %30
  %69 = phi float [ 0.000000e+00, %30 ], [ %38, %37 ], [ %64, %62 ]
  %70 = phi i32 [ 0, %30 ], [ %39, %37 ], [ %55, %62 ]
  %71 = fmul contract float %69, %6
  %72 = icmp eq i32 %7, 1
  %73 = icmp ne i32 %70, 0
  %74 = select i1 %72, i1 %73, i1 false
  %75 = uitofp i32 %70 to float
  %76 = select i1 %74, float %75, float 1.000000e+00
  %77 = fdiv contract float %71, %76
  %78 = mul nsw i32 %26, %5
  %79 = add nsw i32 %25, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  store float %77, float addrspace(1)* %81, align 4, !tbaa !16
  br label %157

82:                                               ; preds = %151, %35
  %83 = phi i32 [ 0, %35 ], [ %154, %151 ]
  %84 = phi i32 [ 0, %35 ], [ %144, %151 ]
  %85 = phi float [ 0.000000e+00, %35 ], [ %153, %151 ]
  %86 = phi i32 [ 0, %35 ], [ %155, %151 ]
  %87 = zext i32 %83 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16, !amdgpu.noclobber !14
  %90 = fptosi float %89 to i32
  %91 = icmp eq i32 %26, %90
  %92 = zext i1 %91 to i32
  %93 = add i32 %84, %92
  br i1 %91, label %94, label %100

94:                                               ; preds = %82
  %95 = mul i32 %83, %5
  %96 = add i32 %95, %25
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %100

100:                                              ; preds = %82, %94
  %101 = phi contract float [ %99, %94 ], [ 0.000000e+00, %82 ]
  %102 = fadd contract float %85, %101
  %103 = or i32 %83, 1
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16, !amdgpu.noclobber !14
  %107 = fptosi float %106 to i32
  %108 = icmp eq i32 %26, %107
  %109 = zext i1 %108 to i32
  %110 = add i32 %93, %109
  br i1 %108, label %111, label %117

111:                                              ; preds = %100
  %112 = mul i32 %103, %5
  %113 = add i32 %112, %25
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %117

117:                                              ; preds = %111, %100
  %118 = phi contract float [ %116, %111 ], [ 0.000000e+00, %100 ]
  %119 = fadd contract float %102, %118
  %120 = or i32 %83, 2
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !14
  %124 = fptosi float %123 to i32
  %125 = icmp eq i32 %26, %124
  %126 = zext i1 %125 to i32
  %127 = add i32 %110, %126
  br i1 %125, label %128, label %134

128:                                              ; preds = %117
  %129 = mul i32 %120, %5
  %130 = add i32 %129, %25
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %134

134:                                              ; preds = %128, %117
  %135 = phi contract float [ %133, %128 ], [ 0.000000e+00, %117 ]
  %136 = fadd contract float %119, %135
  %137 = or i32 %83, 3
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !16, !amdgpu.noclobber !14
  %141 = fptosi float %140 to i32
  %142 = icmp eq i32 %26, %141
  %143 = zext i1 %142 to i32
  %144 = add i32 %127, %143
  br i1 %142, label %145, label %151

145:                                              ; preds = %134
  %146 = mul i32 %137, %5
  %147 = add i32 %146, %25
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %151

151:                                              ; preds = %145, %134
  %152 = phi contract float [ %150, %145 ], [ 0.000000e+00, %134 ]
  %153 = fadd contract float %136, %152
  %154 = add nuw i32 %83, 4
  %155 = add i32 %86, 4
  %156 = icmp eq i32 %155, %36
  br i1 %156, label %37, label %82, !llvm.loop !22

157:                                              ; preds = %68, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
