; ModuleID = '../data/hip_kernels/6565/3/main.cu'
source_filename = "../data/hip_kernels/6565/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21calcMaxPoolForwardGPUPfS_iiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !4
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %12
  %29 = mul i32 %28, %21
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %6, %5
  %33 = mul nsw i32 %32, %7
  %34 = mul nsw i32 %33, %8
  %35 = icmp slt i32 %31, %34
  br i1 %35, label %36, label %155

36:                                               ; preds = %11
  %37 = freeze i32 %31
  %38 = freeze i32 %6
  %39 = sdiv i32 %37, %38
  %40 = mul i32 %39, %38
  %41 = sub i32 %37, %40
  %42 = freeze i32 %7
  %43 = sdiv i32 %39, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %39, %44
  %46 = mul nsw i32 %41, %9
  %47 = mul nsw i32 %45, %9
  %48 = icmp sgt i32 %10, 0
  br i1 %48, label %49, label %68

49:                                               ; preds = %36
  %50 = freeze i32 %8
  %51 = sdiv i32 %43, %50
  %52 = mul i32 %51, %50
  %53 = sub i32 %43, %52
  %54 = mul i32 %51, %4
  %55 = add i32 %54, %53
  %56 = mul i32 %55, %3
  %57 = and i32 %10, 7
  %58 = icmp ult i32 %10, 8
  %59 = and i32 %10, -8
  %60 = icmp eq i32 %57, 0
  br label %61

61:                                               ; preds = %49, %89
  %62 = phi float [ -1.000000e+06, %49 ], [ %90, %89 ]
  %63 = phi i32 [ 0, %49 ], [ %91, %89 ]
  %64 = add i32 %63, %47
  %65 = add i32 %64, %56
  %66 = mul i32 %65, %2
  %67 = add i32 %66, %46
  br i1 %58, label %72, label %93

68:                                               ; preds = %89, %36
  %69 = phi float [ -1.000000e+06, %36 ], [ %90, %89 ]
  %70 = sext i32 %31 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %69, float addrspace(1)* %71, align 4, !tbaa !16
  br label %155

72:                                               ; preds = %93, %61
  %73 = phi float [ undef, %61 ], [ %151, %93 ]
  %74 = phi float [ %62, %61 ], [ %151, %93 ]
  %75 = phi i32 [ 0, %61 ], [ %152, %93 ]
  br i1 %60, label %89, label %76

76:                                               ; preds = %72, %76
  %77 = phi float [ %85, %76 ], [ %74, %72 ]
  %78 = phi i32 [ %86, %76 ], [ %75, %72 ]
  %79 = phi i32 [ %87, %76 ], [ 0, %72 ]
  %80 = add i32 %67, %78
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !14
  %84 = fcmp contract ogt float %83, %77
  %85 = select i1 %84, float %83, float %77
  %86 = add nuw nsw i32 %78, 1
  %87 = add i32 %79, 1
  %88 = icmp eq i32 %87, %57
  br i1 %88, label %89, label %76, !llvm.loop !20

89:                                               ; preds = %76, %72
  %90 = phi float [ %73, %72 ], [ %85, %76 ]
  %91 = add nuw nsw i32 %63, 1
  %92 = icmp eq i32 %91, %10
  br i1 %92, label %68, label %61, !llvm.loop !22

93:                                               ; preds = %61, %93
  %94 = phi float [ %151, %93 ], [ %62, %61 ]
  %95 = phi i32 [ %152, %93 ], [ 0, %61 ]
  %96 = phi i32 [ %153, %93 ], [ 0, %61 ]
  %97 = add i32 %67, %95
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16, !amdgpu.noclobber !14
  %101 = fcmp contract ogt float %100, %94
  %102 = select i1 %101, float %100, float %94
  %103 = or i32 %95, 1
  %104 = add i32 %67, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16, !amdgpu.noclobber !14
  %108 = fcmp contract ogt float %107, %102
  %109 = select i1 %108, float %107, float %102
  %110 = or i32 %95, 2
  %111 = add i32 %67, %110
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !14
  %115 = fcmp contract ogt float %114, %109
  %116 = select i1 %115, float %114, float %109
  %117 = or i32 %95, 3
  %118 = add i32 %67, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16, !amdgpu.noclobber !14
  %122 = fcmp contract ogt float %121, %116
  %123 = select i1 %122, float %121, float %116
  %124 = or i32 %95, 4
  %125 = add i32 %67, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16, !amdgpu.noclobber !14
  %129 = fcmp contract ogt float %128, %123
  %130 = select i1 %129, float %128, float %123
  %131 = or i32 %95, 5
  %132 = add i32 %67, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !16, !amdgpu.noclobber !14
  %136 = fcmp contract ogt float %135, %130
  %137 = select i1 %136, float %135, float %130
  %138 = or i32 %95, 6
  %139 = add i32 %67, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !16, !amdgpu.noclobber !14
  %143 = fcmp contract ogt float %142, %137
  %144 = select i1 %143, float %142, float %137
  %145 = or i32 %95, 7
  %146 = add i32 %67, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16, !amdgpu.noclobber !14
  %150 = fcmp contract ogt float %149, %144
  %151 = select i1 %150, float %149, float %144
  %152 = add nuw nsw i32 %95, 8
  %153 = add i32 %96, 8
  %154 = icmp eq i32 %153, %59
  br i1 %154, label %72, label %93, !llvm.loop !24

155:                                              ; preds = %68, %11
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
!24 = distinct !{!24, !23}
