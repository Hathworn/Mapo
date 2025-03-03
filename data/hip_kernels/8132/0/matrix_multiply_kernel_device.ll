; ModuleID = '../data/hip_kernels/8132/0/main.cu'
source_filename = "../data/hip_kernels/8132/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22matrix_multiply_kernelPhS_Pfiiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %6
  %26 = icmp slt i32 %24, %5
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %169

28:                                               ; preds = %7
  %29 = icmp sgt i32 %3, 0
  br i1 %29, label %30, label %48

30:                                               ; preds = %28
  %31 = sub nsw i32 %24, %4
  %32 = sub nsw i32 %16, %4
  %33 = add nsw i32 %5, -1
  %34 = add nsw i32 %6, -1
  %35 = and i32 %3, 3
  %36 = icmp ult i32 %3, 4
  %37 = and i32 %3, -4
  %38 = icmp eq i32 %35, 0
  br label %39

39:                                               ; preds = %30, %87
  %40 = phi i32 [ 0, %30 ], [ %89, %87 ]
  %41 = phi float [ 0.000000e+00, %30 ], [ %88, %87 ]
  %42 = add nsw i32 %40, %32
  %43 = icmp slt i32 %42, 0
  %44 = icmp slt i32 %42, %6
  %45 = select i1 %44, i32 %42, i32 %34
  %46 = select i1 %43, i32 0, i32 %45
  %47 = mul nsw i32 %46, %5
  br i1 %36, label %59, label %91

48:                                               ; preds = %87, %28
  %49 = phi float [ 0.000000e+00, %28 ], [ %88, %87 ]
  %50 = fcmp contract olt float %49, 0.000000e+00
  %51 = fcmp contract ogt float %49, 2.550000e+02
  %52 = select i1 %51, float 2.550000e+02, float %49
  %53 = select i1 %50, float 0.000000e+00, float %52
  %54 = fptoui float %53 to i8
  %55 = mul nsw i32 %16, %5
  %56 = add nsw i32 %55, %24
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %57
  store i8 %54, i8 addrspace(1)* %58, align 1, !tbaa !7
  br label %169

59:                                               ; preds = %91, %39
  %60 = phi float [ undef, %39 ], [ %165, %91 ]
  %61 = phi i32 [ 0, %39 ], [ %166, %91 ]
  %62 = phi float [ %41, %39 ], [ %165, %91 ]
  br i1 %38, label %87, label %63

63:                                               ; preds = %59, %63
  %64 = phi i32 [ %84, %63 ], [ %61, %59 ]
  %65 = phi float [ %83, %63 ], [ %62, %59 ]
  %66 = phi i32 [ %85, %63 ], [ 0, %59 ]
  %67 = add nsw i32 %64, %31
  %68 = icmp slt i32 %67, 0
  %69 = icmp slt i32 %67, %5
  %70 = select i1 %69, i32 %67, i32 %33
  %71 = select i1 %68, i32 0, i32 %70
  %72 = add nsw i32 %71, %47
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !7, !amdgpu.noclobber !5
  %76 = uitofp i8 %75 to float
  %77 = mul nsw i32 %64, %3
  %78 = add nsw i32 %77, %40
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !10, !amdgpu.noclobber !5
  %82 = fmul contract float %81, %76
  %83 = fadd contract float %65, %82
  %84 = add nuw nsw i32 %64, 1
  %85 = add i32 %66, 1
  %86 = icmp eq i32 %85, %35
  br i1 %86, label %87, label %63, !llvm.loop !12

87:                                               ; preds = %63, %59
  %88 = phi float [ %60, %59 ], [ %83, %63 ]
  %89 = add nuw nsw i32 %40, 1
  %90 = icmp eq i32 %89, %3
  br i1 %90, label %48, label %39, !llvm.loop !14

91:                                               ; preds = %39, %91
  %92 = phi i32 [ %166, %91 ], [ 0, %39 ]
  %93 = phi float [ %165, %91 ], [ %41, %39 ]
  %94 = phi i32 [ %167, %91 ], [ 0, %39 ]
  %95 = add nsw i32 %92, %31
  %96 = icmp slt i32 %95, 0
  %97 = icmp slt i32 %95, %5
  %98 = select i1 %97, i32 %95, i32 %33
  %99 = select i1 %96, i32 0, i32 %98
  %100 = add nsw i32 %99, %47
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !7, !amdgpu.noclobber !5
  %104 = uitofp i8 %103 to float
  %105 = mul nsw i32 %92, %3
  %106 = add nsw i32 %105, %40
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !10, !amdgpu.noclobber !5
  %110 = fmul contract float %109, %104
  %111 = fadd contract float %93, %110
  %112 = or i32 %92, 1
  %113 = add nsw i32 %112, %31
  %114 = icmp slt i32 %113, 0
  %115 = icmp slt i32 %113, %5
  %116 = select i1 %115, i32 %113, i32 %33
  %117 = select i1 %114, i32 0, i32 %116
  %118 = add nsw i32 %117, %47
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %119
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !7, !amdgpu.noclobber !5
  %122 = uitofp i8 %121 to float
  %123 = mul nsw i32 %112, %3
  %124 = add nsw i32 %123, %40
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !10, !amdgpu.noclobber !5
  %128 = fmul contract float %127, %122
  %129 = fadd contract float %111, %128
  %130 = or i32 %92, 2
  %131 = add nsw i32 %130, %31
  %132 = icmp slt i32 %131, 0
  %133 = icmp slt i32 %131, %5
  %134 = select i1 %133, i32 %131, i32 %33
  %135 = select i1 %132, i32 0, i32 %134
  %136 = add nsw i32 %135, %47
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %137
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !7, !amdgpu.noclobber !5
  %140 = uitofp i8 %139 to float
  %141 = mul nsw i32 %130, %3
  %142 = add nsw i32 %141, %40
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %2, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !10, !amdgpu.noclobber !5
  %146 = fmul contract float %145, %140
  %147 = fadd contract float %129, %146
  %148 = or i32 %92, 3
  %149 = add nsw i32 %148, %31
  %150 = icmp slt i32 %149, 0
  %151 = icmp slt i32 %149, %5
  %152 = select i1 %151, i32 %149, i32 %33
  %153 = select i1 %150, i32 0, i32 %152
  %154 = add nsw i32 %153, %47
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %155
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !7, !amdgpu.noclobber !5
  %158 = uitofp i8 %157 to float
  %159 = mul nsw i32 %148, %3
  %160 = add nsw i32 %159, %40
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !10, !amdgpu.noclobber !5
  %164 = fmul contract float %163, %158
  %165 = fadd contract float %147, %164
  %166 = add nuw nsw i32 %92, 4
  %167 = add i32 %94, 4
  %168 = icmp eq i32 %167, %37
  br i1 %168, label %59, label %91, !llvm.loop !16

169:                                              ; preds = %7, %48
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
