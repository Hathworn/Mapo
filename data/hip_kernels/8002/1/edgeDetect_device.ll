; ModuleID = '../data/hip_kernels/8002/1/main.cu'
source_filename = "../data/hip_kernels/8002/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10edgeDetectPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %13, 0
  %23 = icmp slt i32 %13, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %137

25:                                               ; preds = %4
  %26 = icmp sge i32 %21, %2
  %27 = icmp slt i32 %21, 1
  %28 = or i1 %26, %27
  br i1 %28, label %137, label %29

29:                                               ; preds = %25
  %30 = add nsw i32 %21, -1
  %31 = add nsw i32 %13, -1
  %32 = mul nsw i32 %30, %3
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i8 %36 to i32
  %38 = uitofp i8 %36 to double
  %39 = add nsw i32 %13, %32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = zext i8 %42 to i32
  %44 = mul nsw i32 %43, -2
  %45 = add nuw nsw i32 %13, 1
  %46 = add nsw i32 %45, %32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7, !amdgpu.noclobber !5
  %50 = zext i8 %49 to i32
  %51 = sub nsw i32 0, %50
  %52 = sitofp i32 %51 to double
  %53 = fadd contract double %38, %52
  %54 = add nuw nsw i32 %37, %50
  %55 = sub nsw i32 %44, %54
  %56 = sitofp i32 %55 to double
  %57 = mul nsw i32 %21, %3
  %58 = add nsw i32 %31, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7, !amdgpu.noclobber !5
  %62 = zext i8 %61 to i32
  %63 = shl nuw nsw i32 %62, 1
  %64 = sitofp i32 %63 to double
  %65 = fadd contract double %53, %64
  %66 = fadd contract double %65, 0.000000e+00
  %67 = add nuw nsw i32 %13, 1
  %68 = add nsw i32 %67, %57
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !7, !amdgpu.noclobber !5
  %72 = zext i8 %71 to i32
  %73 = mul nsw i32 %72, -2
  %74 = sitofp i32 %73 to double
  %75 = fadd contract double %66, %74
  %76 = add nuw nsw i32 %21, 1
  %77 = mul nsw i32 %76, %3
  %78 = add nsw i32 %31, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %79
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !7, !amdgpu.noclobber !5
  %82 = uitofp i8 %81 to double
  %83 = fadd contract double %56, %82
  %84 = fadd contract double %75, %82
  %85 = add nsw i32 %13, %77
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %86
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !7, !amdgpu.noclobber !5
  %89 = zext i8 %88 to i32
  %90 = fadd contract double %84, 0.000000e+00
  %91 = shl nuw nsw i32 %89, 1
  %92 = sitofp i32 %91 to double
  %93 = fadd contract double %83, %92
  %94 = add nuw nsw i32 %13, 1
  %95 = add nsw i32 %94, %77
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %96
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !7, !amdgpu.noclobber !5
  %99 = zext i8 %98 to i32
  %100 = sub nsw i32 0, %99
  %101 = sitofp i32 %100 to double
  %102 = fadd contract double %90, %101
  %103 = uitofp i8 %98 to double
  %104 = fadd contract double %93, %103
  %105 = fmul contract double %102, %102
  %106 = fmul contract double %104, %104
  %107 = fadd contract double %105, %106
  %108 = fcmp olt double %107, 0x1000000000000000
  %109 = select i1 %108, double 0x4FF0000000000000, double 1.000000e+00
  %110 = fmul double %107, %109
  %111 = tail call double @llvm.amdgcn.rsq.f64(double %110)
  %112 = fmul double %110, %111
  %113 = fmul double %111, 5.000000e-01
  %114 = fneg double %113
  %115 = tail call double @llvm.fma.f64(double %114, double %112, double 5.000000e-01)
  %116 = tail call double @llvm.fma.f64(double %113, double %115, double %113)
  %117 = tail call double @llvm.fma.f64(double %112, double %115, double %112)
  %118 = fneg double %117
  %119 = tail call double @llvm.fma.f64(double %118, double %117, double %110)
  %120 = tail call double @llvm.fma.f64(double %119, double %116, double %117)
  %121 = fneg double %120
  %122 = tail call double @llvm.fma.f64(double %121, double %120, double %110)
  %123 = tail call double @llvm.fma.f64(double %122, double %116, double %120)
  %124 = select i1 %108, double 0x37F0000000000000, double 1.000000e+00
  %125 = fmul double %124, %123
  %126 = fcmp oeq double %110, 0.000000e+00
  %127 = fcmp oeq double %110, 0x7FF0000000000000
  %128 = or i1 %126, %127
  %129 = select i1 %128, double %110, double %125
  %130 = fptosi double %129 to i32
  %131 = tail call i32 @llvm.smax.i32(i32 %130, i32 0)
  %132 = tail call i32 @llvm.umin.i32(i32 %131, i32 255)
  %133 = trunc i32 %132 to i8
  %134 = add nsw i32 %57, %13
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %135
  store i8 %133, i8 addrspace(1)* %136, align 1, !tbaa !7
  br label %137

137:                                              ; preds = %4, %25, %29
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
