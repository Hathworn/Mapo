; ModuleID = '../data/hip_kernels/7222/12/main.cu'
source_filename = "../data/hip_kernels/7222/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11update_woutPdS_i(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = mul nuw nsw i32 %5, 20
  %10 = add nuw nsw i32 %9, %4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds double, double addrspace(1)* %1, i64 %11
  %13 = icmp ult i32 %5, 32
  br i1 %13, label %14, label %27

14:                                               ; preds = %3
  %15 = add nuw nsw i32 %5, 32
  %16 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = icmp ult i32 %15, %17
  br i1 %18, label %19, label %27

19:                                               ; preds = %14
  %20 = mul nuw nsw i32 %15, 20
  %21 = add nuw nsw i32 %20, %4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %25 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %26 = fadd contract double %24, %25
  store double %26, double addrspace(1)* %12, align 8, !tbaa !7
  br label %27

27:                                               ; preds = %19, %14, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ult i32 %5, 16
  br i1 %28, label %29, label %42

29:                                               ; preds = %27
  %30 = add nuw nsw i32 %5, 16
  %31 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  %33 = icmp ult i32 %30, %32
  br i1 %33, label %34, label %42

34:                                               ; preds = %29
  %35 = mul nuw nsw i32 %30, 20
  %36 = add nuw nsw i32 %35, %4
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %40 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %41 = fadd contract double %39, %40
  store double %41, double addrspace(1)* %12, align 8, !tbaa !7
  br label %42

42:                                               ; preds = %34, %29, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ult i32 %5, 8
  br i1 %43, label %44, label %57

44:                                               ; preds = %42
  %45 = add nuw nsw i32 %5, 8
  %46 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %47 = zext i16 %46 to i32
  %48 = icmp ult i32 %45, %47
  br i1 %48, label %49, label %57

49:                                               ; preds = %44
  %50 = mul nuw nsw i32 %45, 20
  %51 = add nuw nsw i32 %50, %4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7
  %55 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %56 = fadd contract double %54, %55
  store double %56, double addrspace(1)* %12, align 8, !tbaa !7
  br label %57

57:                                               ; preds = %49, %44, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = icmp ult i32 %5, 4
  br i1 %58, label %59, label %72

59:                                               ; preds = %57
  %60 = add nuw nsw i32 %5, 4
  %61 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %62 = zext i16 %61 to i32
  %63 = icmp ult i32 %60, %62
  br i1 %63, label %64, label %72

64:                                               ; preds = %59
  %65 = mul nuw nsw i32 %60, 20
  %66 = add nuw nsw i32 %65, %4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %71 = fadd contract double %69, %70
  store double %71, double addrspace(1)* %12, align 8, !tbaa !7
  br label %72

72:                                               ; preds = %64, %59, %57
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = icmp ult i32 %5, 2
  br i1 %73, label %74, label %87

74:                                               ; preds = %72
  %75 = add nuw nsw i32 %5, 2
  %76 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %77 = zext i16 %76 to i32
  %78 = icmp ult i32 %75, %77
  br i1 %78, label %79, label %87

79:                                               ; preds = %74
  %80 = mul nuw nsw i32 %75, 20
  %81 = add nuw nsw i32 %80, %4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %86 = fadd contract double %84, %85
  store double %86, double addrspace(1)* %12, align 8, !tbaa !7
  br label %87

87:                                               ; preds = %79, %74, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = icmp eq i32 %5, 0
  br i1 %88, label %89, label %102

89:                                               ; preds = %87
  %90 = add nuw nsw i32 %5, 1
  %91 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %92 = zext i16 %91 to i32
  %93 = icmp ult i32 %90, %92
  br i1 %93, label %94, label %102

94:                                               ; preds = %89
  %95 = mul nuw nsw i32 %90, 20
  %96 = add nuw nsw i32 %95, %4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %1, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %101 = fadd contract double %99, %100
  store double %101, double addrspace(1)* %12, align 8, !tbaa !7
  br label %102

102:                                              ; preds = %94, %89, %87
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = icmp eq i32 %5, 0
  br i1 %103, label %104, label %113

104:                                              ; preds = %102
  %105 = zext i32 %4 to i64
  %106 = getelementptr inbounds double, double addrspace(1)* %1, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7
  %108 = fmul contract double %107, 5.000000e-01
  %109 = fdiv contract double %108, 5.500000e+01
  %110 = getelementptr inbounds double, double addrspace(1)* %0, i64 %105
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7
  %112 = fsub contract double %111, %109
  store double %112, double addrspace(1)* %110, align 8, !tbaa !7
  br label %113

113:                                              ; preds = %104, %102
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store double 0.000000e+00, double addrspace(1)* %12, align 8, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
