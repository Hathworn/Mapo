; ModuleID = '../data/hip_kernels/10653/16/main.cu'
source_filename = "../data/hip_kernels/10653/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25cuda_conv2D_backPropErrorPdPKdS1_mmmmmmmmmm(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = freeze i64 %23
  %25 = freeze i64 %8
  %26 = udiv i64 %24, %25
  %27 = mul i64 %26, %25
  %28 = sub i64 %24, %27
  %29 = shl i64 %26, 32
  %30 = ashr exact i64 %29, 32
  %31 = freeze i64 %30
  %32 = freeze i64 %6
  %33 = udiv i64 %31, %32
  %34 = mul i64 %33, %32
  %35 = sub i64 %31, %34
  %36 = shl i64 %33, 32
  %37 = ashr exact i64 %36, 32
  %38 = icmp ult i64 %37, %3
  br i1 %38, label %39, label %149

39:                                               ; preds = %13
  %40 = mul i64 %35, %12
  %41 = sub i64 %40, %11
  %42 = mul i64 %37, %8
  %43 = mul i64 %28, %12
  %44 = sub i64 %43, %11
  %45 = icmp eq i64 %8, 0
  br i1 %45, label %149, label %46

46:                                               ; preds = %39
  %47 = mul i64 %37, %6
  %48 = add i64 %47, %35
  %49 = mul i64 %48, %7
  %50 = add i64 %49, %28
  %51 = icmp eq i64 %4, 0
  %52 = icmp eq i64 %5, 0
  %53 = trunc i64 %9 to i32
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %55 = and i64 %5, 1
  %56 = icmp eq i64 %5, 1
  %57 = and i64 %5, -2
  %58 = icmp eq i64 %55, 0
  br label %59

59:                                               ; preds = %46, %65
  %60 = phi i64 [ 0, %46 ], [ %66, %65 ]
  %61 = mul i64 %60, %9
  br i1 %51, label %65, label %62

62:                                               ; preds = %59
  %63 = add i64 %60, %42
  %64 = mul i64 %63, %4
  br label %68

65:                                               ; preds = %101, %59
  %66 = add nuw i64 %60, 1
  %67 = icmp eq i64 %66, %8
  br i1 %67, label %149, label %59, !llvm.loop !7

68:                                               ; preds = %62, %101
  %69 = phi i64 [ 0, %62 ], [ %102, %101 ]
  %70 = add i64 %69, %41
  %71 = trunc i64 %70 to i32
  br i1 %52, label %101, label %72

72:                                               ; preds = %68
  %73 = icmp sgt i32 %71, -1
  %74 = icmp slt i32 %71, %53
  %75 = and i64 %70, 4294967295
  %76 = add i64 %75, %61
  %77 = mul i64 %76, %10
  %78 = add i64 %69, %64
  %79 = mul i64 %78, %5
  br i1 %56, label %80, label %104

80:                                               ; preds = %145, %72
  %81 = phi i64 [ 0, %72 ], [ %146, %145 ]
  br i1 %58, label %101, label %82

82:                                               ; preds = %80
  %83 = add i64 %81, %44
  %84 = trunc i64 %83 to i32
  br i1 %73, label %85, label %101

85:                                               ; preds = %82
  %86 = icmp sgt i32 %84, -1
  %87 = select i1 %74, i1 %86, i1 false
  %88 = icmp slt i32 %84, %53
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %90, label %101

90:                                               ; preds = %85
  %91 = and i64 %83, 4294967295
  %92 = add i64 %91, %77
  %93 = add i64 %81, %79
  %94 = getelementptr inbounds double, double addrspace(1)* %2, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !9
  %96 = load double, double addrspace(1)* %54, align 8, !tbaa !9
  %97 = fmul contract double %95, %96
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %92
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !9
  %100 = fadd contract double %99, %97
  store double %100, double addrspace(1)* %98, align 8, !tbaa !9
  br label %101

101:                                              ; preds = %80, %90, %85, %82, %68
  %102 = add nuw i64 %69, 1
  %103 = icmp eq i64 %102, %4
  br i1 %103, label %65, label %68, !llvm.loop !13

104:                                              ; preds = %72, %145
  %105 = phi i64 [ %146, %145 ], [ 0, %72 ]
  %106 = phi i64 [ %147, %145 ], [ 0, %72 ]
  %107 = add i64 %105, %44
  %108 = trunc i64 %107 to i32
  br i1 %73, label %109, label %125

109:                                              ; preds = %104
  %110 = icmp sgt i32 %108, -1
  %111 = select i1 %74, i1 %110, i1 false
  %112 = icmp slt i32 %108, %53
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %125

114:                                              ; preds = %109
  %115 = and i64 %107, 4294967295
  %116 = add i64 %115, %77
  %117 = add i64 %105, %79
  %118 = getelementptr inbounds double, double addrspace(1)* %2, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !9
  %120 = load double, double addrspace(1)* %54, align 8, !tbaa !9
  %121 = fmul contract double %119, %120
  %122 = getelementptr inbounds double, double addrspace(1)* %0, i64 %116
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !9
  %124 = fadd contract double %123, %121
  store double %124, double addrspace(1)* %122, align 8, !tbaa !9
  br label %125

125:                                              ; preds = %114, %109, %104
  %126 = or i64 %105, 1
  %127 = add i64 %126, %44
  %128 = trunc i64 %127 to i32
  br i1 %73, label %129, label %145

129:                                              ; preds = %125
  %130 = icmp sgt i32 %128, -1
  %131 = select i1 %74, i1 %130, i1 false
  %132 = icmp slt i32 %128, %53
  %133 = select i1 %131, i1 %132, i1 false
  br i1 %133, label %134, label %145

134:                                              ; preds = %129
  %135 = and i64 %127, 4294967295
  %136 = add i64 %135, %77
  %137 = add i64 %126, %79
  %138 = getelementptr inbounds double, double addrspace(1)* %2, i64 %137
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !9
  %140 = load double, double addrspace(1)* %54, align 8, !tbaa !9
  %141 = fmul contract double %139, %140
  %142 = getelementptr inbounds double, double addrspace(1)* %0, i64 %136
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !9
  %144 = fadd contract double %143, %141
  store double %144, double addrspace(1)* %142, align 8, !tbaa !9
  br label %145

145:                                              ; preds = %134, %129, %125
  %146 = add nuw i64 %105, 2
  %147 = add i64 %106, 2
  %148 = icmp eq i64 %147, %57
  br i1 %148, label %80, label %104, !llvm.loop !14

149:                                              ; preds = %65, %39, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
