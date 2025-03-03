; ModuleID = '../data/hip_kernels/8925/11/main.cu'
source_filename = "../data/hip_kernels/8925/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22kernelInterpolationColPdiii(double addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = mul i32 %3, %2
  %23 = icmp slt i32 %13, %22
  %24 = icmp slt i32 %21, %1
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %161

26:                                               ; preds = %4
  %27 = mul i32 %22, %3
  %28 = mul i32 %27, %21
  %29 = add nsw i32 %28, %13
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = add nsw i32 %29, %27
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  %35 = sitofp i32 %3 to double
  %36 = add nsw i32 %1, -1
  %37 = icmp eq i32 %21, %36
  %38 = icmp slt i32 %3, 0
  %39 = icmp sgt i32 %3, 0
  %40 = add i32 %3, 1
  %41 = and i32 %40, 7
  %42 = icmp ult i32 %3, 7
  %43 = and i32 %40, -8
  %44 = icmp eq i32 %41, 0
  %45 = and i32 %3, 7
  %46 = icmp ult i32 %3, 8
  %47 = and i32 %3, -8
  %48 = icmp eq i32 %45, 0
  br label %49

49:                                               ; preds = %160, %26
  %50 = load double, double addrspace(1)* %31, align 8, !tbaa !7
  %51 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %52 = fsub contract double %51, %50
  %53 = fdiv contract double %52, %35
  br i1 %37, label %56, label %54

54:                                               ; preds = %49
  br i1 %38, label %160, label %55

55:                                               ; preds = %54
  br i1 %42, label %147, label %58

56:                                               ; preds = %49
  br i1 %39, label %57, label %160

57:                                               ; preds = %56
  br i1 %46, label %134, label %96

58:                                               ; preds = %55, %58
  %59 = phi i32 [ %93, %58 ], [ %29, %55 ]
  %60 = phi double [ %92, %58 ], [ %50, %55 ]
  %61 = phi i32 [ %94, %58 ], [ 0, %55 ]
  %62 = sext i32 %59 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  store double %60, double addrspace(1)* %63, align 8, !tbaa !7
  %64 = fadd contract double %53, %60
  %65 = add nsw i32 %59, %27
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %66
  store double %64, double addrspace(1)* %67, align 8, !tbaa !7
  %68 = fadd contract double %53, %64
  %69 = add nsw i32 %65, %27
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  store double %68, double addrspace(1)* %71, align 8, !tbaa !7
  %72 = fadd contract double %53, %68
  %73 = add nsw i32 %69, %27
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  store double %72, double addrspace(1)* %75, align 8, !tbaa !7
  %76 = fadd contract double %53, %72
  %77 = add nsw i32 %73, %27
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %0, i64 %78
  store double %76, double addrspace(1)* %79, align 8, !tbaa !7
  %80 = fadd contract double %53, %76
  %81 = add nsw i32 %77, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %0, i64 %82
  store double %80, double addrspace(1)* %83, align 8, !tbaa !7
  %84 = fadd contract double %53, %80
  %85 = add nsw i32 %81, %27
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  store double %84, double addrspace(1)* %87, align 8, !tbaa !7
  %88 = fadd contract double %53, %84
  %89 = add nsw i32 %85, %27
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  store double %88, double addrspace(1)* %91, align 8, !tbaa !7
  %92 = fadd contract double %53, %88
  %93 = add nsw i32 %89, %27
  %94 = add i32 %61, 8
  %95 = icmp eq i32 %94, %43
  br i1 %95, label %147, label %58, !llvm.loop !11

96:                                               ; preds = %57, %96
  %97 = phi i32 [ %131, %96 ], [ %29, %57 ]
  %98 = phi double [ %130, %96 ], [ %51, %57 ]
  %99 = phi i32 [ %132, %96 ], [ 0, %57 ]
  %100 = sext i32 %97 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %0, i64 %100
  store double %98, double addrspace(1)* %101, align 8, !tbaa !7
  %102 = fsub contract double %98, %53
  %103 = add nsw i32 %97, %27
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %0, i64 %104
  store double %102, double addrspace(1)* %105, align 8, !tbaa !7
  %106 = fsub contract double %102, %53
  %107 = add nsw i32 %103, %27
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %0, i64 %108
  store double %106, double addrspace(1)* %109, align 8, !tbaa !7
  %110 = fsub contract double %106, %53
  %111 = add nsw i32 %107, %27
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %0, i64 %112
  store double %110, double addrspace(1)* %113, align 8, !tbaa !7
  %114 = fsub contract double %110, %53
  %115 = add nsw i32 %111, %27
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %0, i64 %116
  store double %114, double addrspace(1)* %117, align 8, !tbaa !7
  %118 = fsub contract double %114, %53
  %119 = add nsw i32 %115, %27
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double addrspace(1)* %0, i64 %120
  store double %118, double addrspace(1)* %121, align 8, !tbaa !7
  %122 = fsub contract double %118, %53
  %123 = add nsw i32 %119, %27
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %0, i64 %124
  store double %122, double addrspace(1)* %125, align 8, !tbaa !7
  %126 = fsub contract double %122, %53
  %127 = add nsw i32 %123, %27
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %0, i64 %128
  store double %126, double addrspace(1)* %129, align 8, !tbaa !7
  %130 = fsub contract double %126, %53
  %131 = add nsw i32 %127, %27
  %132 = add i32 %99, 8
  %133 = icmp eq i32 %132, %47
  br i1 %133, label %134, label %96, !llvm.loop !13

134:                                              ; preds = %96, %57
  %135 = phi i32 [ %29, %57 ], [ %131, %96 ]
  %136 = phi double [ %51, %57 ], [ %130, %96 ]
  br i1 %48, label %160, label %137

137:                                              ; preds = %134, %137
  %138 = phi i32 [ %144, %137 ], [ %135, %134 ]
  %139 = phi double [ %143, %137 ], [ %136, %134 ]
  %140 = phi i32 [ %145, %137 ], [ 0, %134 ]
  %141 = sext i32 %138 to i64
  %142 = getelementptr inbounds double, double addrspace(1)* %0, i64 %141
  store double %139, double addrspace(1)* %142, align 8, !tbaa !7
  %143 = fsub contract double %139, %53
  %144 = add nsw i32 %138, %27
  %145 = add i32 %140, 1
  %146 = icmp eq i32 %145, %45
  br i1 %146, label %160, label %137, !llvm.loop !14

147:                                              ; preds = %58, %55
  %148 = phi i32 [ %29, %55 ], [ %93, %58 ]
  %149 = phi double [ %50, %55 ], [ %92, %58 ]
  br i1 %44, label %160, label %150

150:                                              ; preds = %147, %150
  %151 = phi i32 [ %157, %150 ], [ %148, %147 ]
  %152 = phi double [ %156, %150 ], [ %149, %147 ]
  %153 = phi i32 [ %158, %150 ], [ 0, %147 ]
  %154 = sext i32 %151 to i64
  %155 = getelementptr inbounds double, double addrspace(1)* %0, i64 %154
  store double %152, double addrspace(1)* %155, align 8, !tbaa !7
  %156 = fadd contract double %53, %152
  %157 = add nsw i32 %151, %27
  %158 = add i32 %153, 1
  %159 = icmp eq i32 %158, %41
  br i1 %159, label %160, label %150, !llvm.loop !16

160:                                              ; preds = %147, %150, %134, %137, %54, %56
  br label %49, !llvm.loop !17

161:                                              ; preds = %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !12}
