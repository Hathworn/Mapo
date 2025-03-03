; ModuleID = '../data/hip_kernels/16444/3/main.cu'
source_filename = "../data/hip_kernels/16444/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30convolution_global_memory_grayPhPfS_mmm(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i64 %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = add i64 %5, 8589934591
  %8 = lshr i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = sub i32 0, %9
  %11 = shl i32 %9, 1
  %12 = trunc i64 %3 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = add i32 %21, %9
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %30 = add i32 %28, %29
  %31 = add i32 %30, %9
  %32 = icmp slt i32 %31, %9
  br i1 %32, label %156, label %33

33:                                               ; preds = %6
  %34 = trunc i64 %4 to i32
  %35 = sub i32 %34, %9
  %36 = add i32 %35, %11
  %37 = icmp uge i32 %31, %36
  %38 = icmp slt i32 %22, %9
  %39 = select i1 %37, i1 true, i1 %38
  %40 = sub i32 %12, %9
  %41 = add i32 %40, %11
  %42 = icmp uge i32 %22, %41
  %43 = select i1 %39, i1 true, i1 %42
  %44 = icmp sgt i32 %10, %9
  %45 = select i1 %43, i1 true, i1 %44
  br i1 %45, label %156, label %46

46:                                               ; preds = %33
  %47 = mul i32 %30, %12
  %48 = add i32 %47, %21
  %49 = trunc i64 %5 to i32
  %50 = zext i32 %48 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %50
  %52 = add nuw nsw i32 %11, 1
  %53 = and i32 %52, 3
  %54 = icmp ult i32 %11, 3
  br label %55

55:                                               ; preds = %46, %85
  %56 = phi i32 [ %10, %46 ], [ %86, %85 ]
  %57 = add nsw i32 %56, %22
  %58 = add nsw i32 %56, %9
  %59 = mul i32 %58, %49
  %60 = add i32 %59, %9
  %61 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7
  br label %62

62:                                               ; preds = %62, %55
  %63 = phi i8 [ %61, %55 ], [ %80, %62 ]
  %64 = phi i32 [ %10, %55 ], [ %81, %62 ]
  %65 = phi i32 [ 0, %55 ], [ %82, %62 ]
  %66 = add nsw i32 %64, %31
  %67 = mul i32 %66, %12
  %68 = add i32 %57, %67
  %69 = add i32 %60, %64
  %70 = zext i32 %68 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7
  %73 = uitofp i8 %72 to float
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !10
  %77 = fmul contract float %76, %73
  %78 = uitofp i8 %63 to float
  %79 = fadd contract float %77, %78
  %80 = fptoui float %79 to i8
  store i8 %80, i8 addrspace(1)* %51, align 1, !tbaa !7
  %81 = add i32 %64, 1
  %82 = add i32 %65, 1
  %83 = icmp eq i32 %82, %53
  br i1 %83, label %84, label %62, !llvm.loop !12

84:                                               ; preds = %62
  br i1 %54, label %85, label %88

85:                                               ; preds = %88, %84
  %86 = add i32 %56, 1
  %87 = icmp eq i32 %56, %9
  br i1 %87, label %156, label %55, !llvm.loop !14

88:                                               ; preds = %84, %88
  %89 = phi i8 [ %153, %88 ], [ %80, %84 ]
  %90 = phi i32 [ %154, %88 ], [ %81, %84 ]
  %91 = add nsw i32 %90, %31
  %92 = mul i32 %91, %12
  %93 = add i32 %57, %92
  %94 = add i32 %60, %90
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7
  %98 = uitofp i8 %97 to float
  %99 = zext i32 %94 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !10
  %102 = fmul contract float %101, %98
  %103 = uitofp i8 %89 to float
  %104 = fadd contract float %102, %103
  %105 = fptoui float %104 to i8
  store i8 %105, i8 addrspace(1)* %51, align 1, !tbaa !7
  %106 = add i32 %90, 1
  %107 = add nsw i32 %106, %31
  %108 = mul i32 %107, %12
  %109 = add i32 %57, %108
  %110 = add i32 %60, %106
  %111 = zext i32 %109 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %111
  %113 = load i8, i8 addrspace(1)* %112, align 1, !tbaa !7
  %114 = uitofp i8 %113 to float
  %115 = zext i32 %110 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !10
  %118 = fmul contract float %117, %114
  %119 = uitofp i8 %105 to float
  %120 = fadd contract float %118, %119
  %121 = fptoui float %120 to i8
  store i8 %121, i8 addrspace(1)* %51, align 1, !tbaa !7
  %122 = add i32 %90, 2
  %123 = add nsw i32 %122, %31
  %124 = mul i32 %123, %12
  %125 = add i32 %57, %124
  %126 = add i32 %60, %122
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %127
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !7
  %130 = uitofp i8 %129 to float
  %131 = zext i32 %126 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !10
  %134 = fmul contract float %133, %130
  %135 = uitofp i8 %121 to float
  %136 = fadd contract float %134, %135
  %137 = fptoui float %136 to i8
  store i8 %137, i8 addrspace(1)* %51, align 1, !tbaa !7
  %138 = add i32 %90, 3
  %139 = add nsw i32 %138, %31
  %140 = mul i32 %139, %12
  %141 = add i32 %57, %140
  %142 = add i32 %60, %138
  %143 = zext i32 %141 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !7
  %146 = uitofp i8 %145 to float
  %147 = zext i32 %142 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !10
  %150 = fmul contract float %149, %146
  %151 = uitofp i8 %137 to float
  %152 = fadd contract float %150, %151
  %153 = fptoui float %152 to i8
  store i8 %153, i8 addrspace(1)* %51, align 1, !tbaa !7
  %154 = add i32 %90, 4
  %155 = icmp eq i32 %138, %9
  br i1 %155, label %85, label %88, !llvm.loop !16

156:                                              ; preds = %85, %33, %6
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
