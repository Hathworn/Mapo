; ModuleID = '../data/hip_kernels/3557/8/main.cu'
source_filename = "../data/hip_kernels/3557/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21spatial_output_kerneljjjfPfPj(i32 %0, i32 %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = mul i32 %2, %1
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %9 = mul i32 %7, %8
  %10 = mul i32 %9, %0
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = udiv i32 %19, %16
  %24 = mul i32 %23, %16
  %25 = icmp ugt i32 %19, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %16
  %29 = icmp ult i32 %22, %7
  br i1 %29, label %30, label %39

30:                                               ; preds = %6
  %31 = icmp ugt i32 %0, 1
  %32 = icmp eq i32 %0, 1
  %33 = add i32 %0, -1
  %34 = add i32 %0, -2
  %35 = and i32 %33, 7
  %36 = icmp ult i32 %34, 7
  %37 = and i32 %33, -8
  %38 = icmp eq i32 %35, 0
  br label %40

39:                                               ; preds = %160, %6
  ret void

40:                                               ; preds = %30, %160
  %41 = phi i32 [ %22, %30 ], [ %161, %160 ]
  br i1 %31, label %42, label %126

42:                                               ; preds = %40
  %43 = add i32 %41, %10
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !5
  br i1 %36, label %134, label %47

47:                                               ; preds = %42, %47
  %48 = phi i32 [ %123, %47 ], [ 1, %42 ]
  %49 = phi float [ %122, %47 ], [ %46, %42 ]
  %50 = phi i32 [ %121, %47 ], [ 0, %42 ]
  %51 = phi i32 [ %124, %47 ], [ 0, %42 ]
  %52 = mul i32 %7, %48
  %53 = add i32 %43, %52
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !5
  %57 = fcmp contract ogt float %56, %49
  %58 = select i1 %57, i32 %48, i32 %50
  %59 = select i1 %57, float %56, float %49
  %60 = add nuw nsw i32 %48, 1
  %61 = mul i32 %7, %60
  %62 = add i32 %43, %61
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !5
  %66 = fcmp contract ogt float %65, %59
  %67 = select i1 %66, i32 %60, i32 %58
  %68 = select i1 %66, float %65, float %59
  %69 = add nuw nsw i32 %48, 2
  %70 = mul i32 %7, %69
  %71 = add i32 %43, %70
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16, !amdgpu.noclobber !5
  %75 = fcmp contract ogt float %74, %68
  %76 = select i1 %75, i32 %69, i32 %67
  %77 = select i1 %75, float %74, float %68
  %78 = add nuw nsw i32 %48, 3
  %79 = mul i32 %7, %78
  %80 = add i32 %43, %79
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !5
  %84 = fcmp contract ogt float %83, %77
  %85 = select i1 %84, i32 %78, i32 %76
  %86 = select i1 %84, float %83, float %77
  %87 = add nuw nsw i32 %48, 4
  %88 = mul i32 %7, %87
  %89 = add i32 %43, %88
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = fcmp contract ogt float %92, %86
  %94 = select i1 %93, i32 %87, i32 %85
  %95 = select i1 %93, float %92, float %86
  %96 = add nuw nsw i32 %48, 5
  %97 = mul i32 %7, %96
  %98 = add i32 %43, %97
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %4, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16, !amdgpu.noclobber !5
  %102 = fcmp contract ogt float %101, %95
  %103 = select i1 %102, i32 %96, i32 %94
  %104 = select i1 %102, float %101, float %95
  %105 = add nuw nsw i32 %48, 6
  %106 = mul i32 %7, %105
  %107 = add i32 %43, %106
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %4, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !5
  %111 = fcmp contract ogt float %110, %104
  %112 = select i1 %111, i32 %105, i32 %103
  %113 = select i1 %111, float %110, float %104
  %114 = add nuw i32 %48, 7
  %115 = mul i32 %7, %114
  %116 = add i32 %43, %115
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %4, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16, !amdgpu.noclobber !5
  %120 = fcmp contract ogt float %119, %113
  %121 = select i1 %120, i32 %114, i32 %112
  %122 = select i1 %120, float %119, float %113
  %123 = add nuw i32 %48, 8
  %124 = add i32 %51, 8
  %125 = icmp eq i32 %124, %37
  br i1 %125, label %134, label %47, !llvm.loop !20

126:                                              ; preds = %40
  br i1 %32, label %127, label %160

127:                                              ; preds = %126
  %128 = add i32 %41, %10
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %4, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16, !amdgpu.noclobber !5
  %132 = fcmp contract ogt float %131, %3
  %133 = zext i1 %132 to i32
  br label %155

134:                                              ; preds = %47, %42
  %135 = phi i32 [ undef, %42 ], [ %121, %47 ]
  %136 = phi i32 [ 1, %42 ], [ %123, %47 ]
  %137 = phi float [ %46, %42 ], [ %122, %47 ]
  %138 = phi i32 [ 0, %42 ], [ %121, %47 ]
  br i1 %38, label %155, label %139

139:                                              ; preds = %134, %139
  %140 = phi i32 [ %152, %139 ], [ %136, %134 ]
  %141 = phi float [ %151, %139 ], [ %137, %134 ]
  %142 = phi i32 [ %150, %139 ], [ %138, %134 ]
  %143 = phi i32 [ %153, %139 ], [ 0, %134 ]
  %144 = mul i32 %7, %140
  %145 = add i32 %43, %144
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %4, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16, !amdgpu.noclobber !5
  %149 = fcmp contract ogt float %148, %141
  %150 = select i1 %149, i32 %140, i32 %142
  %151 = select i1 %149, float %148, float %141
  %152 = add nuw i32 %140, 1
  %153 = add i32 %143, 1
  %154 = icmp eq i32 %153, %35
  br i1 %154, label %155, label %139, !llvm.loop !22

155:                                              ; preds = %134, %139, %127
  %156 = phi i32 [ %133, %127 ], [ %135, %134 ], [ %150, %139 ]
  %157 = add i32 %41, %9
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %158
  store i32 %156, i32 addrspace(1)* %159, align 4, !tbaa !24
  br label %160

160:                                              ; preds = %155, %126
  %161 = add i32 %41, %28
  %162 = icmp ult i32 %161, %7
  br i1 %162, label %40, label %39, !llvm.loop !26
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !18, i64 0}
!26 = distinct !{!26, !21}
